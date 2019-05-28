-- ADT (5a)
-- ARTIKEL := TUBLE OP(ARTNR:NUMBER, MGE:STRING, PREIS:FLOAT, KUEHL:STRING, ARTBEZ:STRING, ANZBO:NUMBER)
-- BESTA := TUPLE OF(ARTIKEL:ARTIKEL, MENGE:NUMBER, WERT:FLOAT)
-- BESTA_NT := LIST OF(BESTA:BESTA)
-- KUNDE := TUPLE OF(KNR:NUMBER, KNAME:STRING, PLZ:NUMBER, ORT:STRING, STRASSE:STRING, KKLIMIT:FLOAT)
-- BESTELLAT := TUPLE OF(BSTNR:NUMBER, KUNDE:KUNDE, STATUS:NUMBER, RSUM:FLOAT, BESTDAT:DATE, LIEFDAT:DATE, RECHDAT:DATE, ARTLIST:BESTA_NT)



CREATE OR REPLACE TYPE BESTA AS OBJECT(
    ARTNR number,
    MENGE number,
    WERT float
);

CREATE OR REPLACE TYPE BESTA_NT AS TABLE OF BESTA;

CREATE TABLE BESTELLAT (
    BSTNR NUMBER PRIMARY KEY,
    KNR NUMBER,
    STATUS NUMBER,
    RSUM NUMBER(12,2),
    BESTDAT DATE,
    LIEFDAT DATE,
    RECHDAT DATE,
    ARTLIST BESTA_NT
)
NESTED TABLE ARTLIST STORE AS ARTLIST_TAB;

ALTER TABLE BESTELLAT ADD FOREIGN KEY (KNR) REFERENCES KUNDE(KNR);
-- ALTER TABLE ARTLIST_TAB ADD FOREIGN KEY (ARTNR) REFERENCES ARTIKEL(ARTNR);
