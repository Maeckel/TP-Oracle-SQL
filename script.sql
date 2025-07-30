/* SQL - Schéma */

CREATE TABLE TOURISTE(
       nom		VARCHAR2(20),
       prenom		VARCHAR2(20),
       age		NUMBER(2),
       paysOrigine	VARCHAR2(20),
       CONSTRAINT touriste_nom_pk PRIMARY KEY(nom)
       CONSTRAINT verif_age_ck CHECK (age < 100)
);

CREATE TABLE MONUMENT(
       nom		VARCHAR(25),
       ville		VARCHAR(20),
       pays		VARCHAR(20),
       anneeConstruction INTEGER,
       CONSTRAINT monument_nom_pk PRIMARY KEY(nom)
       CONSTRAINT monument_ville_annee_UNI UNIQUE(ville,anneeConstruction)
);

CREATE TABLE VISITE(
       nomTouriste	VARCHAR(20),
       nomMonument	VARCHAR(25),
       dateVisite	DATE,
       prixEntree	NUMBER(2),
       CONSTRAINT visite_pk PRIMARY KEY(nomTouriste,nomMonument,dateVisite),
       CONSTRAINT visite_touriste_fk FOREIGN KEY(nomTouriste) REFERENCES TOURISTE ON DELETE CASCADE,
       CONSTRAINT visite_monument_fk FOREIGN KEY(nomMonument) REFERENCES MONUMENT ON DELETE CASCADE,
       CONSTRAINT verif_prix_ck CHECK( prixEntree >= 0 ),
       CONSTRAINT verif_date_ck CHECK( dateVisite >= to_date('01-01-2000','DD/MM/YYYY'))
);

insert into Touriste values('Bonaparte','Napoleon',37,'France');
insert into Touriste values('Tepes','Vlad',28,'Roumanie');
insert into Touriste values('Legrand','Alexandre',33,'Grece');
insert into Touriste values('Deux','Nicolas',41,'Russie');
insert into Touriste values('Cesar','Jules',44,'Italie');
insert into Touriste values('Darc','Jeanne',18,'France');
insert into Touriste values('Magne','Charles',62,'Allemagne');
insert into Touriste values('Corcovado','Thais',48,'Bresil');
insert into Touriste values('Stote','Harry',65,'Grece');


insert into Monument values('Chateau de Dracula','Bran','Roumanie',1377);
insert into Monument values('Tour Eiffel','Paris','France',1889);
insert into Monument values('Corcovado','Rio','Bresil',1931);
insert into Monument values('Colisee','Rome','Italie',80);
insert into Monument values('Tour de Pise','Pise','Italie',1350);
insert into Monument values('Chateau de Versailles','Versailles','France',null);
insert into Monument values('Cathedrale de la Se','Sao Paolo','Bresil',1954);
insert into Monument values('Maison du Peuple','Bucarest','Roumanie',1984);
insert into Monument values('Musee du CNAM','Paris','France',1794);
insert into Monument values('Notre-Dame','Paris','France',1345);
insert into Monument values('Vatican','Rome','Italie',null);


insert into Visite values('Bonaparte','Colisee',to_date('2011/12/12','YYYY/MM/DD'),10);
insert into Visite values('Tepes','Cathedrale de la Se',to_date('2013/05/18','YYYY/MM/DD'),0);
insert into Visite values('Cesar','Tour Eiffel',to_date('2011/01/01','YYYY/MM/DD'),15);
insert into Visite values('Legrand','Tour Eiffel',to_date('2011/01/01','YYYY/MM/DD'),25);
insert into Visite values('Cesar','Corcovado',to_date('2009/12/25','YYYY/MM/DD'),12);
insert into Visite values('Legrand','Chateau de Dracula',to_date('2012/02/14','YYYY/MM/DD'),null);
insert into Visite values('Cesar','Cathedrale de la Se',to_date('2009/12/18','YYYY/MM/DD'),5);
insert into Visite values('Bonaparte','Maison du Peuple',to_date('2013/09/25','YYYY/MM/DD'),20);
insert into Visite values('Darc','Tour Eiffel',to_date('2014/02/02','YYYY/MM/DD'),18);
insert into Visite values('Darc','Musee du CNAM',to_date('2013/11/19','YYYY/MM/DD'),8);
insert into Visite values('Darc','Notre-Dame',to_date('2014/01/13','YYYY/MM/DD'),0);
insert into Visite values('Cesar','Vatican',to_date('2014/02/14','YYYY/MM/DD'),30);
insert into Visite values('Magne','Vatican',to_date('2012/06/07','YYYY/MM/DD'),25);
insert into Visite values('Deux','Notre-Dame',to_date('2010/12/12','YYYY/MM/DD'),0);
insert into Visite values('Cesar','Chateau de Dracula',sysdate-300,15);
insert into Visite values('Cesar','Tour Eiffel',sysdate-20,6);
insert into Visite values('Cesar','Corcovado',sysdate-60,5);
insert into Visite values('Cesar','Colisee',sysdate-400,20);
insert into Visite values('Cesar','Tour de Pise',sysdate-5,10);
insert into Visite values('Cesar','Chateau de Versailles',sysdate-155,25);
insert into Visite values('Cesar','Cathedrale de la Se',sysdate-500,0);
insert into Visite values('Cesar','Maison du Peuple',sysdate-700,5);
insert into Visite values('Cesar','Musee du CNAM',sysdate-2,0);
insert into Visite values('Cesar','Notre-Dame',sysdate-2,0);
insert into Visite values('Cesar','Vatican',sysdate-250,30);
insert into Visite values('Legrand','Musee du CNAM',sysdate-2,5);
insert into Visite values('Darc','Colisee',sysdate-30,15);
insert into Visite values('Darc','Maison du Peuple',sysdate-120,10);
insert into Visite values('Stote','Notre-Dame',sysdate-5,3);
insert into Visite values('Stote','Musee du CNAM',sysdate-10,3);
insert into Visite values('Stote','Chateau de Versailles',sysdate-300,30);
insert into Visite values('Stote','Chateau de Dracula',sysdate-500,5);
insert into Visite values('Stote','Tour Eiffel',sysdate-40,20);
insert into Visite values('Stote','Corcovado',sysdate-600,5);
insert into Visite values('Stote','Colisee',sysdate-55,20);
insert into Visite values('Stote','Tour de Pise',sysdate-65,15);
insert into Visite values('Stote','Cathedrale de la Se',sysdate-700,5);
insert into Visite values('Stote','Maison du Peuple',sysdate-35,5);
insert into Visite values('Stote','Vatican',sysdate-250,20);
insert into Visite values('Darc','Musee du CNAM',sysdate-170,4);
insert into Visite values('Deux','Notre-Dame',sysdate,0);

/* SQL - Interrogation */

/* 1 */
SELECT * FROM Monument;

/* 2 */
SELECT * FROM Touriste where paysOrigine = 'France';

/* 3 */
SELECT nom , ville FROM Monument where pays = 'Roumanie';

/* 4 */
SELECT DISTINCT ville FROM Monument where anneeConstruction BETWEEN 500 AND 1500;
/* SELECT DISTINCT ville FROM Monument where anneeConstruction >= 500 AND anneeConstruction <= 1500 */

/* 5 */
SELECT DISTINCT nomTouriste FROM Visite WHERE prixEntree =0 AND to_char(dateVisite,'YYYY') = to_char(sysdate,'YYYY');

/* 6 */
SELECT DISTINCT nomMonument FROM Visite where nomMonument LIKE 'Tour%' AND prixEntree >= 20;

/* 7 */
SELECT * FROM Monument ORDER BY ville , anneeConstruction DESC;

/* 8 */
SELECT nom FROM Monument WHERE anneeConstruction IS NULL;

/* 9 */
SELECT nomTouriste , prenom , age , nomMonument FROM Touriste , Visite WHERE nom = nomTouriste;

/* 10 */
SELECT DISTINCT ville FROM Monument , Visite WHERE nom = nomMonument AND prixEntree = 0;

/* 11 */
SELECT DISTINCT paysOrigine FROM Touriste , Visite , Monument WHERE pays = 'Bresil' AND Monument.nom = Visite.nomMonument AND Touriste.nom = Visite.nomTouriste;
/*SELECT DISTINCT paysOrigine FROM Touriste JOIN Visite JOIN Monument ON Monument.nom = Visite.nomMonument ON Touriste.nom = Visite.nomTouriste WHERE pays = 'Bresil';*/

/* 12 */
SELECT nom , prenom , nomMonument FROM Touriste , Visite WHERE nom = nomTouriste AND nomTouriste = nomMonument ;

/* 13 */
SELECT * FROM Touriste T1 , Touriste T2 WHERE T1.paysOrigine = T2.paysOrigine AND T1.nom < T2.nom;

/* 14 */
SELECT Touriste.nom , paysOrigine FROM Touriste , Monument WHERE Touriste.nom = Monument.nom AND paysOrigine = pays;

/* 15 */
SELECT DISTINCT T1.nom , T2.nom , T1.paysOrigine , T2.paysOrigine FROM Touriste T1 , Touriste T2 , Visite WHERE T1.nom = T2.nom AND nomMonument = nomMonument AND dateVisite = dateVisite;

/* 16 */
SELECT DISTINCT paysOrigine AS pays FROM Touriste
UNION
SELECT DISTINCT pays AS pays FROM Monument;

/* 17 */
SELECT DISTINCT paysOrigine FROM Touriste , Monument , Visite WHERE nomTouriste = Touriste.nom AND nomMonument = Monument.nom AND paysOrigine != pays;

/* 18 */
SELECT DISTINCT ville FROM Monument , Visite WHERE nom = nomMonument AND prixEntree > 15;

/* 19 */
SELECT T.nom, T.paysOrigine
FROM Touriste T
WHERE NOT EXISTS (
    SELECT 1
    FROM Visite V
    JOIN Monument M ON V.nomMonument = M.nom
    WHERE V.nomTouriste = T.nom
    AND M.pays = T.paysOrigine
);

/* 20 */
SELECT DISTINCT T.nom, T.age , Monument.nom
FROM Touriste T , Monument , Visite
WHERE EXISTS (
    SELECT 1
    FROM Monument M
    WHERE EXTRACT(YEAR FROM SYSDATE) - T.age < M.anneeConstruction
) AND nomTouriste = T.nom AND nomMonument = Monument.nom ;

/* 21 */
SELECT nom FROM Touriste WHERE age < (
	SELECT MIN(EXTRACT(YEAR FROM SYSDATE) - anneeConstruction) AS age FROM Monument
);

/* 22 */
SELECT nom FROM Touriste WHERE age = (
	SELECT MIN(age) FROM Touriste
);

/* 23 */
SELECT DISTINCT nomMonument FROM Visite WHERE prixEntree = (
	SELECT MIN(prixEntree) FROM Visite WHERE to_char(dateVisite,'YYYY') = '2009'
);

/* Vues */

/* 1 */
CREATE OR REPLACE VIEW touristeFrancais AS 
    SELECT nom , prenom , age , paysOrigine
    FROM Touriste
    WHERE paysOrigine IN ('France' , 'Italie') WITH CHECK OPTION;

INSERT INTO touristeFrancais VALUES('Doe' , 'John' , 26 , 'Royaume-Uni');

SELECT * FROM touristeFrancais;

/* 2 */
CREATE OR REPLACE VIEW sommeEntree_monument AS
    SELECT nomMonument , SUM(prixEntree) AS Total
    FROM Visite
    GROUP BY nomMonument;

SELECT * FROM sommeEntree_monument;

/* 3 */
CREATE OR REPLACE VIEW visite_2025 AS 
    SELECT DISTINCT paysOrigine 
    FROM Touriste , Visite
    WHERE Touriste.nom = Visite.nomTouriste AND to_char(dateVisite,'yyyy') = to_char(sysdate,'yyyy');

SELECT * FROM visite_2025;

/* SQL - création/modification */

/* 1 */
INSERT INTO Monument VALUES('Musée de l’Ermitage', 'Saint-Pertesbourg', 'Russie', 1852);

/* 2 */
ALTER TABLE Visite
ADD avis VARCHAR(30);

/* 3 */
ALTER TABLE Monument
MODIFY ville VARCHAR(40) NOT NULL;

/* 4 */
ALTER TABLE Visite DROP dateVisite;

/* 5 */
DELETE FROM Touriste;

/* 6 */
DELETE FROM Monument WHERE pays = 'France';

/* 7 */
UPDATE Visite SET prixEntree = prixEntree * 0.9;

/* 8 */
DROP TABLE Touriste;

/* SQL - PL/SQL */

/* 1 */
CREATE OR REPLACE FUNCTION gainMonument(p_Monument MONUMENT.nom%TYPE) RETURN INTEGER IS 
    v_gain INTEGER;
begin

    SELECT SUM(prixEntree) INTO v_gain
	FROM Visite
	WHERE nomMOnument = p_monument;
	RETURN v_gain;

EXCEPTION
	WHEN no_data_found then dbms_output.put_line('Je ne connais pas ce monument');
end;
/

SELECT nom , gainMonument(nom) FROM Monument;    

/* 2 */

CREATE OR REPLACE PROCEDURE gainPays AS
    CURSOR c_gainPays IS SELECT pays , sum(prixEntree) AS gain FROM visite , monument
						 WHERE nomMonument = nom
    					 GROUP BY pays;
	v_gainPays c_gainPays%ROWTYPE;
BEGIN
    OPEN c_gainPays;
	FETCH c_gainPays INTO v_gainPays;
	WHILE c_gainPays%FOUND LOOP
		dbms_output.put_line('Pour ' || v_gainPays.pays || ' a rapporté ' || v_gainPays.gain || ' euros.');
		FETCH c_gainPays INTO v_gainPays;
	END LOOP;
	CLOSE c_gainPays;
END;
/

EXEC gainPays;

/* 3 */

CREATE OR REPLACE PROCEDURE sedentaire AS
	CURSOR c_listeTouristes IS SELECT * FROM touriste;
	v_touriste c_listeTouristes%ROWTYPE;	
	v_nbSorties INTEGER;
BEGIN
    OPEN c_listeTouristes;
	FETCH c_listeTouristes INTO v_touriste;
	WHILE c_listeTouristes%FOUND LOOP
    	SELECT COUNT(*) INTO v_nbSorties
        FROM visite , monument
        WHERE nom = nomMonument and v_touriste.paysOrigine = pays;
		IF v_nbSorties != 0 THEN
            dbms_output.put_line(v_touriste.nom || ' n aime pas l aventure');
		ELSE
             dbms_output.put_line(v_touriste.nom || ' est sorti de chez lui !');
		END IF;
		FETCH c_listeTouristes INTO v_touriste;
	END LOOP;
END;
/

EXEC sedentaire;

/* Trigger */

/* 1 */

CREATE OR REPLACE TRIGGER VerifAnneeConstruction
BEFORE INSERT OR UPDATE OF anneeConstruction ON MONUMENT
FOR EACH ROW
BEGIN
    IF :NEW.anneeConstruction > to_char(sysdate, 'yyyy') THEN
    	raise_application_error(-20001, 'On ne peut pas ajouter un monument du futur !');
    END IF;
END;
/
INSERT INTO monument VALUES ('Statue de Cédric', 'Paris', 'France', 2030);

/* 2 */

/* CREATE OR REPLACE TRIGGER VerifAnneeConstruction */

/* Plan d’exécution */

/* 1A */
SELECT nom , ville FROM Monument WHERE pays = 'Roumanie';

/* 1B */
SELECT nom , ville FROM Monument WHERE pays = 'Roumanie';
select * from table(dbms_xplan.display_cursor(:LIVESQL_LAST_SQL_ID));

/* 1C */
SELECT count(*) FROM Monument WHERE pays = 'Roumanie';
select * from table(dbms_xplan.display_cursor(:LIVESQL_LAST_SQL_ID));

/* 1D */
SELECT * FROM Monument WHERE anneeConstruction IS NULL;
select * from table(dbms_xplan.display_cursor(:LIVESQL_LAST_SQL_ID));

/* 1E */
SELECT * FROM Monument WHERE anneeConstruction < to_char(sysdate,'yyyy') - 500;
select * from table(dbms_xplan.display_cursor(:LIVESQL_LAST_SQL_ID));

/* 1F */
SELECT * FROM Monument WHERE anneeConstruction < 1801;
select * from table(dbms_xplan.display_cursor(:LIVESQL_LAST_SQL_ID));

/* 1G */
SELECT * FROM Monument WHERE anneeConstruction < 1801 AND pays = 'Roumanie';
select * from table(dbms_xplan.display_cursor(:LIVESQL_LAST_SQL_ID));
