//////////////////////////////////////////////////////////////////////
//
//  FILE:       pbook.cpp
//              PBook class methods
//
//  Part of:    Scid (Shane's Chess Information Database)
//  Version:    2.3
//
//  Notice:     Copyright (c) 1999-2000  Shane Hudson.  All rights reserved.
//
//  Author:     Shane Hudson (sgh@users.sourceforge.net)
//
//////////////////////////////////////////////////////////////////////


// A PBook is a collection of chess positions, each with a textual
// comment or description.


#include "common.h"
#include "error.h"
#include "pbook.h"
#include "misc.h"
#include "mfile.h"

#include <stdio.h>
#include <string.h>


// PBOOK_HASH_BITS: Size of array of hash value counts.
static const uint PBOOK_HASH_BITS = 65536;
static const uint PBOOK_HASH_BYTES = (PBOOK_HASH_BITS >> 3);
#define PBOOK_HASH(pos) ((pos)->HashValue() & (PBOOK_HASH_BITS - 1))

typedef char compactBoardStr [36];


PBook::~PBook ()
{
    bookNodeT * node;

    for (uint i=0; i <= PBOOK_MAX_MATERIAL; i++) {
        Tree[i]->IterateStart();
        while ((node = Tree[i]->Iterate()) != NULL) {
            delete[] node->data.comment;
        }
        delete Tree[i];
    }
    delete[] FileName;
    delete[] HashFlags;
    delete[] NodeList;
}

void
PBook::SetHashFlag (Position * pos) {
    uint hash = PBOOK_HASH(pos);
    uint index = hash >> 3;
    uint mask = 1 << (hash & 7);
    if (HashFlags == NULL) {
        HashFlags = new byte [PBOOK_HASH_BYTES];
        for (uint i=0; i < PBOOK_HASH_BYTES >> 3; i++) { HashFlags[i] = 0; }
    }
    HashFlags[index] |= mask;
}

bool
PBook::GetHashFlag (Position * pos)
{
    uint hash = PBOOK_HASH(pos);
    uint index = hash >> 3;
    uint mask = 1 << (hash & 7);
    if (HashFlags == NULL) { return true; }
    return ((HashFlags[index] & mask) != 0);
}


void
PBook::AddNodeToList (bookNodeT * node)
{
    ASSERT (NodeListCount <= NodeListCapacity);
    if (NodeListCount >= NodeListCapacity) {
        NodeListCapacity += NodeListCapacity;
        bookNodePtrT * newlist = new bookNodePtrT [NodeListCapacity];
        for (uint i=0; i < NodeListCount; i++) {
            newlist[i] = NodeList[i];
        }
        delete[] NodeList;
        NodeList = newlist;
    }
    NodeList[NodeListCount] = node;
    node->data.id = NodeListCount;
    NodeListCount++;
}

void
PBook::Init ()
{
    Altered = false;
    ReadOnly = false;
    LeastMaterial = PBOOK_MAX_MATERIAL;
    SkipCount = 0;
    FileName = NULL;
    for (uint t=0; t <= PBOOK_MAX_MATERIAL; t++) {
        Tree[t] = new StrTree<bookDataT>;
    }
    NextIndex = 0;
    Stats_PositionBytes = 0;
    Stats_CommentBytes = 0;
    for (uint i=0; i <= PBOOK_MAX_MATERIAL; i++) {
        Stats_Lookups[i] = Stats_Inserts[i] = 0;
    }
    Stats_TotalLookups = 0;
    Stats_TotalInserts = 0;
    NodeListCapacity = 1000;
    NodeList = new bookNodePtrT [NodeListCapacity];
    NodeListCount = 0;
    HashFlags = NULL;
}

void
PBook::Clear ()
{
    bookNodeT * node;

    Altered = false;
    for (uint i=0; i <= PBOOK_MAX_MATERIAL; i++) {
        Tree[i]->IterateStart();
        while ((node = Tree[i]->Iterate()) != NULL) {
            delete[] node->data.comment;
        }
        delete Tree[i];
        Tree[i] = new StrTree<bookDataT>;
    }
    NodeListCount = 0;
    if (FileName) { delete[] FileName; }
    FileName = NULL;
    NextIndex = 0;
    LeastMaterial = PBOOK_MAX_MATERIAL;
    Stats_PositionBytes = 0;
    Stats_CommentBytes = 0;
    delete[] HashFlags;

    HashFlags = NULL;
}

void
PBook::SetFileName (const char * fname)
{
    if (FileName) { delete[] FileName; }
    if (!fname) { FileName = NULL; return; }

    // Allocate space for the filename string:
    FileName = strDuplicate(fname);
}

inline const char *
epd_findOpcode (const char * epdStr, const char * opcode)
{
    const char * s = epdStr;
    while (*s != 0) {
        while (*s == ' '  ||  *s == '\n') { s++; }
        if (strIsPrefix (opcode, s)) {
            const char *codeEnd = s + strLength(opcode);
            if (*codeEnd == ' ') {
                return codeEnd + 1;
            }
        }
        while (*s != '\n'  &&  *s != 0) { s++; }
    }
    return NULL;
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::Find(): Find a position and get its comment.
errorT
PBook::Find (Position * pos, const char ** ptrComment)
{
    // First, check the optimisation of material count:
    uint material = pos->GetCount(WHITE) + pos->GetCount(BLACK);
    ASSERT (material <= PBOOK_MAX_MATERIAL);
    if (Tree[material]->Size() == 0) {
        SkipCount++;
        return ERROR_NotFound;
    }

    Stats_Lookups[material]++;
    Stats_TotalLookups++;

    // Quick check if any boards in the tree start with the first byte
    // of this board, to save time:
    byte firstByte = pos->CompactStrFirstByte();
    if (Tree[material]->FirstByteSize (firstByte) == 0) {
        SkipCount++;
        return ERROR_NotFound;
    }

    // Quick check if the hash value of the search position is
    // not the hash value of any positions in the tree:
    if (! GetHashFlag (pos)) {
        SkipCount++;
        return ERROR_NotFound;
    }

    // Generate the compact board string for this position, and lookup:
    compactBoardStr cboard;
    pos->PrintCompactStr (cboard);
    bookNodeT * node = Tree[material]->Lookup (cboard);
    if (!node) { return ERROR_NotFound; }
    if (ptrComment) { *ptrComment = node->data.comment; }
    return OK;
}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::FindOpcode():
//    Finds a positition and extracts the requested opcode.
errorT
PBook::FindOpcode (Position * pos, const char * opcode, DString * target)
{
    const char * comment = NULL;
    errorT err = Find (pos, &comment);
    if (err != OK) { return ERROR_NotFound; }

    const char * s = epd_findOpcode (comment, opcode);
    if (s == NULL) { return ERROR_NotFound; }
    while (*s != 0  &&  *s != '\n') {
        target->AddChar (*s);
        s++;
    }
    return OK;
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::Insert(): Insert a position. Returns OK if a new position
//      was inserted, or updates the comment and returns ERROR_Exists if
//      the position was already in the PBook.
errorT
PBook::Insert (Position * pos, const char * comment)
{
    ASSERT (pos && comment);
    bookNodeT * node;
    errorT err;
    
    uint material = pos->GetCount(WHITE) + pos->GetCount(BLACK);
    compactBoardStr cboard;
    pos->PrintCompactStr (cboard);
    err = Tree[material]->Insert (cboard, &node);
    if (err != OK) {  // Already exists; we overwrite the old data.
        delete[] node->data.comment;
    } else {
        SetHashFlag (pos);
        AddNodeToList (node);
    }
    node->data.comment = strDuplicate (comment);
    node->data.enpassant = pos->GetEPTarget();
    Altered = true;

    if (material < LeastMaterial) {
        LeastMaterial = material;
    }
    Stats_Inserts[material]++;
    Stats_TotalInserts++;
    return err;
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::Delete():
//    Delete a position from the PBook.
errorT
PBook::Delete (Position * pos)
{
    uint material = pos->GetCount(WHITE) + pos->GetCount(BLACK);
    compactBoardStr cboard;
    pos->PrintCompactStr (cboard);
    bookNodeT * node = Tree[material]->Delete (cboard);
    if (!node) { return ERROR_NotFound; }

    NodeList[node->data.id] = NULL;
    // Delete the comment string:
    delete[] node->data.comment;
    delete node;
    Altered = true;
    return OK;
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::EcoSummary():
//    Produce a summary from the PBook for the specified ECO code prefix.
void
PBook::EcoSummary (const char * ecoPrefix, DString * dstr)
{
    uint depth = strLength (ecoPrefix);
    const char * prevEcoStr = "";
    for (uint i=0; i < NodeListCount; i++) {
        bookNodeT * node = NodeList[i];
        if (node == NULL) { continue; }
        const char * comment = node->data.comment;
        const char * ecoStr = epd_findOpcode (comment, "eco");
        const char * movesStr = epd_findOpcode (comment, "moves");
        if (ecoStr != NULL  &&  strIsPrefix (ecoPrefix, ecoStr)) {
            if (depth < 3  &&  strPrefix (ecoStr, prevEcoStr) >= depth+1) {
                continue;
            }
            prevEcoStr = ecoStr;
            while (*ecoStr != '\n'  &&  *ecoStr != 0) {
                dstr->AddChar (*ecoStr);
                ecoStr++;
            }
            dstr->Append ("  ");
            while (*movesStr != '\n'  &&  *movesStr != 0) {
                dstr->AddChar (*movesStr);
                movesStr++;
            }
            dstr->AddChar ('\n');
        }
    }    
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::ReadEcoFile():
//    Read an ECO (not EPD) format file.
errorT
PBook::ReadEcoFile ()
{
    MFile fp;
    if (fp.Open (FileName, FMODE_ReadOnly) != OK) {
        return ERROR_FileOpen;
    }

    ReadOnly = true;
    LineCount = 1;
    Position std_start;
    std_start.StdStart();
    DString text;
    DString moves;
    ecoStringT ecoStr;
    ecoT ecoCode;
    int ch;
    errorT err = OK;
    bool done = false;

    // Loop to read in and add all positions:

    while (!done) {
        // Find the next ECO code:
        while (true) {
            ch = fp.ReadOneByte();
            if (ch == EOF) { done = true; break; }
            if (ch == '\n') { LineCount++; }
            if (ch >= 'A'  &&  ch <= 'E') { break; }
            if (ch == '#') {
                while (ch != '\n'  &&  ch != EOF) {
                    ch = fp.ReadOneByte();
                }
                if (ch == EOF) { done = true; }
                LineCount++;
            }
        }
        if (done) { break; }

        // Read in the rest of the ECO code:
        ecoStr[0] = ch;
        ch = fp.ReadOneByte();
        if (ch < '0'  ||  ch > '9') { goto corrupt; }
        ecoStr[1] = ch;
        ch = fp.ReadOneByte();
        if (ch < '0'  ||  ch > '9') { goto corrupt; }
        ecoStr[2] = ch;
        ecoStr[3] = 0;

        // Now check for optional extra part of code, e.g. "A00a1":
        ch = fp.ReadOneByte();
        if (ch >= 'a'  &&  ch <= 'z') {
            ecoStr[3] = ch; ecoStr[4] = 0;
            ch = fp.ReadOneByte();
            if (ch >= '1'  &&  ch <= '4') {
                ecoStr[4] = ch; ecoStr[5] = 0;
            }
        }

        // Now put ecoCode in the text string and read the text in quotes:
        ecoCode = eco_FromString (ecoStr);
        eco_ToExtendedString (ecoCode, ecoStr);
        text.Clear();
        text.Append ("eco ", ecoStr, " [");

        // Find the start of the text:
        while ((ch = fp.ReadOneByte()) != '"') {
            if (ch == EOF) { goto corrupt; }
        }
        while ((ch = fp.ReadOneByte()) != '"') {
            if (ch == EOF) { goto corrupt; }
            text.AddChar ((char) ch);
        }
        text.Append ("]\n");

        // Now read the position:
        moves.Clear();
        char prev = 0;
        while ((ch = fp.ReadOneByte()) != '*') {
            if (ch == EOF) { goto corrupt; }
            if (ch == '\n') {
                ch = ' ';
                LineCount++;
            }
            if (ch != ' '  ||  prev != ' ') {
                moves.AddChar ((char) ch);
            }
            prev = ch;
        }
        Position pos (std_start);
        err = pos.ReadLine (moves.Data());
        if (err != OK) { goto corrupt; }
        text.Append ("moves ", strTrimLeft (moves.Data()), "\n");
        if (Insert (&pos, text.Data()) != OK) {
            // Position already exists: just ignore it.
        }
    }
    fp.Close();
    return OK;
corrupt:
    fp.Close();
    return ERROR_Corrupt;
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::ReadFile(): read in a file.
errorT
PBook::ReadFile ()
{
    ASSERT (FileName != NULL);

    ReadOnly = false;
    MFile fp;
    if (fp.Open (FileName, FMODE_Both) != OK) {
        ReadOnly = true;
        if (fp.Open (FileName, FMODE_ReadOnly) != OK) {
            return ERROR_FileOpen;
        }
    }

    LineCount = 1;
    Position * pos = new Position;
    DString * line = new DString;
    fp.ReadLine (line);
    DString dstr;
    
    while (! fp.EndOfFile()) {

        if (pos->ReadFromFEN (line->Data()) != OK) {
            fprintf (stderr, "Error reading line: %u\n", LineCount);
            LineCount++;
            line->Clear();
            fp.ReadLine (line);
            continue;
            //exit (1);
        }

        char * s = (char *) line->Data();
        // Skip over first four fields, which were the position:
        while (*s == ' ') { s++; }
        for (uint i=0; i < 4; i++) {
            while (*s != ' '  &&  *s != 0) { s++; }
            while (*s == ' ') { s++; }
        }
        // Now process each field in turn:
        while (*s == ';'  ||  *s == ' ') { s++; }
        dstr.Clear();
        while (*s != 0) {
            while (*s == ';'  ||  *s == ' ') { s++; }
            bool seenCode = false;
            while (*s != ';'  &&  *s != 0) {
                seenCode = true;
                char ch = *s;
                // Check for backslash (escape) character:
                if (ch == '\\') {
                    s++;
                    ch = *s;
                    // "\s" -> semicolon within a field:
                    if (ch == 's') { ch = ';'; }
                }
                dstr.AddChar (ch);
                s++;
            }
            if (seenCode) { dstr.AddChar ('\n'); }
        }

        if (Insert (pos, dstr.Data()) != OK) {
            //fprintf (stderr, "Warning: position already exists! Line %u\n",
            //         LineCount);
        }
        LineCount++;
        line->Clear();
        fp.ReadLine (line);
    }
    delete pos;
    delete line;
    fp.Close();
    Altered = false;
    NextIndex = NodeListCount - 1;
    return OK;
}
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// PBook::WriteFile(): writes the entire PBook to a file.
errorT
PBook::WriteFile ()
{
    ASSERT (FileName != NULL);
    bookNodeT * node;
    FILE * fp = fopen (FileName, "w");
    if (!fp) { return ERROR_FileOpen; }

    Stats_PositionBytes = 0;
    Stats_CommentBytes = 0;

    Position * pos = new Position;
    char tempStr [200];
    for (uint i=0; i < NodeListCount; i++) {
        node = NodeList[i];
        if (node == NULL) { continue; }
        if (pos->ReadFromCompactStr ((const byte *) node->name) != OK) {
            fclose (fp);
            delete pos;
            return ERROR_Corrupt;
        }
        pos->SetEPTarget (node->data.enpassant);
        pos->PrintFEN (tempStr, FEN_CASTLING_EP);
        fprintf (fp, "%s", tempStr);
        Stats_PositionBytes += strLength (tempStr);
        bool atCodeStart = true;
        char * s = node->data.comment;
        while (*s != 0) {
            if (*s == '\n') {
                if (! atCodeStart) { fputc (';', fp); Stats_CommentBytes++; }
                atCodeStart = true;
                s++;
                while (*s == ' ') { s++; }
            } else {
                if (atCodeStart) { fputc (' ', fp); Stats_CommentBytes++; }
                atCodeStart = false;
                // Encode "\" as "\\" and ";" as "\s":
                char ch = *s;
                switch (ch) {
                case '\\':
                    fputc ('\\', fp);
                    fputc ('\\', fp);
                    Stats_CommentBytes += 2;
                    break;
                case ';':
                    fputc ('\\', fp);
                    fputc ('s', fp);
                    Stats_CommentBytes += 2;
                    break;
                default:
                    fputc (ch, fp);
                    Stats_CommentBytes++;
                }
                s++;
            }
        }
        fputc ('\n', fp);
        Stats_CommentBytes++;
    }
    fclose(fp);
    delete pos;
    Altered = false;
    return OK;
}

//////////////////////////////////////////////////////////////////////
//  EOF: pbook.cpp
//////////////////////////////////////////////////////////////////////
