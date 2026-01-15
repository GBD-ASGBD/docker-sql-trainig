# Consultes SQL per practicar

## 1. Consultes Simples (SELECT, WHERE, ORDER BY)
1. Llista tots els productes del fabricant 'aci'.
    <details>
    <summary>Solució</summary>

    ```
    SELECT * 
    FROM producte 
    WHERE fabcod = 'aci';
    ```

    </details>
2. Mostra el nom i l'edat dels representants de vendes de més de 40 anys.
    <details>
    <summary>Solució</summary>

    ```
    SELECT nom, edat 
    FROM repvenda 
    WHERE edat > 40;
    ```

    </details>
3. Obtén les ciutats i les vendes de les oficines de la regió 'Este'.
    <details>
    <summary>Solució</summary>

    ```
    SELECT ciutat, vendes 
    FROM oficina 
    WHERE regio = 'Este';
    ```

    </details>
4. Llista els identificadors dels clients i el nom dels clients amb un límit de crèdit superior a 50.000.
    <details>
    <summary>Solució</summary>

    ```
    SELECT cliecod, nom 
    FROM client 
    WHERE limcred > 50000;
    ```

    </details>
5. Mostra les comandes realitzades el mes de gener de 2020.
    <details>
    <summary>Solució</summary>

    ```
    SELECT * 
    FROM comanda 
    WHERE data BETWEEN '2020-01-01' AND '2020-01-31';
    ```

    </details>
6. Troba els productes amb existències entre 10 i 50 unitats.
    <details>
    <summary>Solució</summary>

    ```
    SELECT * 
    FROM producte 
    WHERE exist BETWEEN 10 AND 50;
    ```

    </details>
7. Llista el nom i la data de contracte dels representants de vendes ordenats per data de contracte (més recents primer).
    <details>
    <summary>Solució</summary>

    ```
    SELECT nom, datacontracte 
    FROM repvenda 
    ORDER BY datacontracte DESC;
    ```

    </details>
8. Mostra els noms dels clients que no tenen assignat el representant 101.
    <details>
    <summary>Solució</summary>

    ```
    SELECT nom 
    FROM client 
    WHERE repcod <> 101;
    ```

    </details>
9. Obtén el codi i la descripció dels productes el preu dels quals sigui superior a 500€.
    <details>
    <summary>Solució</summary>

    ```
    SELECT fabcod, prodcod, descrip 
    FROM producte 
    WHERE preu > 500;
    ```

    </details>
10. Llista la ciutat de les oficines on les vendes han superat l'objectiu.
    <details>
    <summary>Solució</summary>

    ```
    SELECT ciutat 
    FROM oficina 
    WHERE vendes > objectiu;
    ```

    </details>
11. Mostra els representants contractats després del 2019-01-01.
    <details>
    <summary>Solució</summary>

    ```
    SELECT repcod, nom, datacontracte
    FROM repvenda
    WHERE datacontracte > DATE '2019-01-01'
    ORDER BY datacontracte; 
    ```

    </details>
12. Mostra els 5 productes més cars.
    <details>
    <summary>Solució</summary>

    ```
    SELECT fabcod, prodcod, descrip, preu
    FROM producte
    ORDER BY preu DESC
    LIMIT 5; 
    ```

    </details>
13. Mostra els 5 productes més barats.
    <details>
    <summary>Solució</summary>

    ```
    SELECT fabcod, prodcod, descrip, preu
    FROM producte
    ORDER BY preu ASC
    LIMIT 5; 
    ```

    </details>
14. Mostra els clients ordenats per límit de crèdit (desc) i nom (asc).
    <details>
    <summary>Solució</summary>

    ```
    SELECT cliecod, nom, limcred
    FROM client
    ORDER BY limcred DESC, nom ASC;
    ```

    </details>
15. Mostra clients amb nom que contingui “Corp”. 
    <details>
    <summary>Solució</summary>

    ```
    SELECT cliecod, nom
    FROM client
    WHERE nom ILIKE '%Corp%'; 
    ```

    </details>
## 2. Consultes complexes (JOINs)
1. Mostra el número de comanda, la data i el nom del client que la va fer.
    <details>
    <summary>Solució</summary>
    
    ```
    SELECT c.comnum, c.data, cl.nom 
    FROM comanda c 
    JOIN client cl ON c.cliecod = cl.cliecod; 
    ```
    
    </details>
2. Llista el nom dels representants i el nom de la ciutat de l'oficina on treballen. Si no treballen a cap oficina també ha de sortir
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT r.nom, o.ciutat 
    FROM repvenda r 
    LEFT JOIN oficina o ON r.ofinum = o.ofinum; 
    ```
    
    </details>
3. Llista el número de comanda i la descripció dels seus productes.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT c.comnum, p.descrip 
    FROM comanda c 
    JOIN producte p ON c.fabcod = p.fabcod AND c.prodcod = p.prodcod; 
    ```
    
    </details>
4. Mostra el nom dels clients com a client i el nom del representant de vendes que tenen assignat com a representant.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT cl.nom AS client, r.nom AS representant 
    FROM client cl 
    JOIN repvenda r ON cl.repcod = r.repcod; 
    ```
    
    </details>
5. Llista el nom de cada representant com a empleat i el nom del seu cap (jefe) com a cap.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT r1.nom AS empleat, r2.nom AS cap 
    FROM repvenda r1 
    LEFT JOIN repvenda r2 ON r1.jefe = r2.repcod; 
    ```
    
    </details>
6. Troba la ciuitat de les oficines i el nom del seu director.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT o.ciutat, r.nom AS director 
    FROM oficina o 
    JOIN repvenda r ON o.director = r.repcod; 
    ```
    
    </details>
7. Mostra totes les comandes fetes per clients de l'oficina de 'Chicago'.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT c.* 
    FROM comanda c 
    JOIN client cl ON c.cliecod = cl.cliecod 
    JOIN repvenda r ON cl.repcod = r.repcod 
    JOIN oficina o ON r.ofinum = o.ofinum 
    WHERE o.ciutat = 'Chicago'; 
    ```
    
    </details>
8. Llista la descripció dels productes venuts (comandes) pel representant 'Bill Adams'.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT DISTINCT p.descrip 
    FROM producte p 
    JOIN comanda c ON p.fabcod = c.fabcod AND p.prodcod = c.prodcod 
    JOIN repvenda r ON c.repcod = r.repcod 
    WHERE r.nom = 'Bill Adams'; 
    ```
    
    </details>
9. Obtén les ciutats de les oficines on treballen representants que han venut més de 300.000.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT DISTINCT o.ciutat 
    FROM oficina o 
    JOIN repvenda r ON o.ofinum = r.ofinum 
    WHERE r.vendes > 300000; 
    ```
    
    </details>
10. Mostra el nom dels clients que han comprat productes del fabricant 'rei'.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT DISTINCT cl.nom 
    FROM client cl 
    JOIN comanda c ON cl.cliecod = c.cliecod 
    WHERE c.fabcod = 'rei'; 
    ```
    
    </details>
11. Mostra comandes amb: client, representant assignat al client i representant de la comanda.
    <details>
    <summary>Solució</summary>

    ```
    SELECT co.comnum,
        cl.nom AS client,
        rp_client.nom AS rep_client,
        rp_comanda.nom AS rep_comanda,
        co.import
    FROM comanda co
    JOIN client cl ON cl.cliecod = co.cliecod
    JOIN repvenda rp_client ON rp_client.repcod = cl.repcod
    LEFT JOIN repvenda rp_comanda ON rp_comanda.repcod = co.repcod
    ORDER BY co.comnum; 
    ```

    </details>
12. Mostra representants i (si existeixen) les comandes que han gestionat. Ordena la informació per representant i data
    <details>
    <summary>Solució</summary>

    ```
    SELECT rp.repcod, rp.nom, co.comnum, co.data, co.import
    FROM repvenda rp
    LEFT JOIN comanda co ON co.repcod = rp.repcod
    ORDER BY rp.repcod, co.data;  
    ```

    </details>
13. Mostra comandes amb nom del client i regió de l’oficina del representant de la comanda.
    <details>
    <summary>Solució</summary>

    ```
    SELECT co.comnum, cl.nom AS client, of.regio, co.import
    FROM comanda co
    JOIN client cl ON cl.cliecod = co.cliecod
    JOIN repvenda rp ON rp.repcod = co.repcod
    LEFT JOIN oficina of ON of.ofinum = rp.ofinum
    ORDER BY co.comnum; 
    ```

    </details>
14. Mostra comandes on el representant de la comanda i el representant del client NO coincideixen.
    <details>
    <summary>Solució</summary>

    ```
    SELECT co.comnum, cl.nom AS client, cl.repcod AS rep_client, co.repcod AS rep_comanda
    FROM comanda co
    JOIN client cl ON cl.cliecod = co.cliecod
    WHERE co.repcod IS NOT NULL
    AND cl.repcod <> co.repcod
    ORDER BY co.comnum; 
    ```

    </details>
15. Mostra el numero de comanda, la descripció del producte, la quantitat venuda, el preu del producte, l'import “real” de la comanda calculat com quant * preu i l'import de la comanda.
    <details>
    <summary>Solució</summary>

    ```
    SELECT co.comnum,
        pr.descrip,
        co.quant,
        pr.preu,
        (co.quant * pr.preu) AS import_calculat,
        co.import AS import_guardat
    FROM comanda co
    JOIN producte pr ON pr.fabcod = co.fabcod AND pr.prodcod = co.prodcod
    ORDER BY co.comnum; 
    ```

    </details>
16. Mostra la cadena jeràrquica simple: representant → cap → cap del cap (si existeix).
    <details>
    <summary>Solució</summary>

    ```
    SELECT r.nom AS rep,
        j1.nom AS jefe,
        j2.nom AS jefe_del_jefe
    FROM repvenda r
    LEFT JOIN repvenda j1 ON j1.repcod = r.jefe
    LEFT JOIN repvenda j2 ON j2.repcod = j1.jefe
    ORDER BY r.repcod; 
    ```

    </details>


## 3. Agrupacions i Funcions Agregades (GROUP BY, HAVING)
Ideal per obtenir estadístiques i resums de dades.
1. Quantes comandes ha fet cada client? Mostra el codi del client i quantes comandes.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT cliecod, COUNT(*) 
    FROM comanda 
    GROUP BY cliecod; 
    ```
    
    </details>
2. Quin és l'import total venut per cada representant?
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT repcod, SUM(import) 
    FROM comanda 
    GROUP BY repcod; 
    ```
    
    </details>
3. Quina és la mitjana de preu dels productes de cada fabricant?
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT fabcod, AVG(preu) 
    FROM producte 
    GROUP BY fabcod; 
    ```
    
    </details>
4. Mostra el límit de crèdit màxim dels clients assignats a cada representant.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT repcod, MAX(limcred) 
    FROM client 
    GROUP BY repcod; 
    ```
    
    </details>
5. Quantes oficines hi ha a cada regió?
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT regio, COUNT(*) 
    FROM oficina 
    GROUP BY regio; 
    ```
    
    </details>
6. Llista els clients que han gastat més de 10.000 en total.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT cliecod, SUM(import) 
    FROM comanda 
    GROUP BY cliecod 
    HAVING SUM(import) > 10000; 
    ```
    
    </details>
7. Quin és el producte més car de cada fabricant?
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT fabcod, MAX(preu) 
    FROM producte 
    GROUP BY fabcod; 
    ```
    
    </details>
8. Compta quants representants hi ha a cada oficina.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT ofinum, COUNT(*) 
    FROM repvenda 
    WHERE ofinum IS NOT NULL 
    GROUP BY ofinum; 
    ```
    
    </details>
9. Suma total de les quotes dels representants per oficina.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT ofinum, SUM(quota) 
    FROM repvenda 
    GROUP BY ofinum; 
    ```
    
    </details>
10. Mostra els fabricants que tenen més de 5 productes diferents.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT fabcod, COUNT(*) 
    FROM producte 
    GROUP BY fabcod 
    HAVING COUNT(*) > 5; 
    ```
    
    </details>
11. Productes que mai s’han venut.
    <details>
    <summary>Solució</summary>

    ```
    SELECT pr.fabcod, pr.prodcod, pr.descrip
    FROM producte pr
    WHERE NOT EXISTS (
        SELECT 1
        FROM comanda co
        WHERE co.fabcod = pr.fabcod AND co.prodcod = pr.prodcod
    ); 
    ```

    </details>
12. Comandes amb import superior a la mitjana del seu representant (subconsulta correlacionada).
    <details>
    <summary>Solució</summary>

    ```
    SELECT co.comnum, co.repcod, co.import
    FROM comanda co
    WHERE co.repcod IS NOT NULL
    AND co.import > (
        SELECT AVG(c2.import)
        FROM comanda c2
        WHERE c2.repcod = co.repcod
    )
    ORDER BY co.repcod, co.import DESC; 
    ```

    </details>
13. Import total per mes (2020) usant date_trunc.
    <details>
    <summary>Solució</summary>

    ```
    SELECT date_trunc('month', data)::date AS mes, SUM(import) AS import_total
    FROM comanda
    WHERE data >= DATE '2020-01-01' AND data < DATE '2021-01-01'
    GROUP BY date_trunc('month', data)
    ORDER BY mes; 
    ```

    </details>
14. Import total venut per ciutat d’oficina del representant que ha fet la comanda.
    <details>
    <summary>Solució</summary>

    ```
    SELECT of.ciutat, SUM(co.import) AS import_total
    FROM oficina of
    JOIN repvenda rp ON rp.ofinum = of.ofinum
    JOIN comanda co ON co.repcod = rp.repcod
    GROUP BY of.ciutat
    ORDER BY import_total DESC; 
    ```

    </details>
--------------------------------------------------------------------------------
## 4. Subconsultes
Consultes dins d'altres consultes per a filtres complexos.
1. Llista els productes amb un preu superior a la mitjana de tots els productes.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT * 
    FROM producte 
    WHERE preu > (SELECT AVG(preu) FROM producte); 
    ```
    
    </details>
2. Troba els representants que treballen en oficines on les vendes superen l'objectiu.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT nom 
    FROM repvenda
     WHERE ofinum IN (SELECT ofinum FROM oficina WHERE vendes > objectiu); 
    ```
    
    </details>
3. Mostra el nom dels clients que no han realitzat cap comanda.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT nom 
    FROM client 
    WHERE cliecod NOT IN (SELECT cliecod FROM comanda); 
    ```
    
    </details>
4. Llista el nom dels representants que han venut més que el representant 105.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT nom 
    FROM repvenda 
    WHERE vendes > (SELECT vendes FROM repvenda WHERE repcod = 105); 
    ```
    
    </details>
5. Obtén la descripció dels productes que s'han demanat en quantitats superiors a 20 unitats en una sola comanda.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT descrip 
    FROM producte 
    WHERE (fabcod, prodcod) IN (SELECT fabcod, prodcod FROM comanda WHERE quant > 20); 
    ```
    
    </details>
6. Mostra el nom del client amb el límit de crèdit més alt.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT nom 
    FROM client 
    WHERE limcred = (SELECT MAX(limcred) FROM client); 
    ```
    
    </details>
7. Llista el nom dels representants que tenen més vendes que la quota de qualsevol oficina.
    ◦<details>
    <summary>Solució</summary>
    
    ```
     SELECT nom 
     FROM repvenda 
     WHERE vendes > (SELECT MAX(quota) FROM repvenda); 
    ```
    
    </details>
8. Troba la descripció dels productes que no s'han venut mai.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT descrip 
    FROM producte p 
    WHERE NOT EXISTS (SELECT 1 FROM comanda c WHERE c.fabcod = p.fabcod AND c.prodcod = p.prodcod); 
    ```
    
    </details>
9. Mostra el nom i la seva edat dels representants que tenen l'edat mínima dins de la seva oficina.
    ◦ <details>
    <summary>Solució</summary>
    
    ```
    SELECT nom, edat 
    FROM repvenda r1 
    WHERE edat = (SELECT MIN(edat) FROM repvenda r2 WHERE r1.ofinum = r2.ofinum); 
    ```
    
    </details>
10. Clients que tenen més d’una comanda (subconsulta amb COUNT).
    <details>
    <summary>Solució</summary>

    ```
    SELECT cl.cliecod, cl.nom
    FROM client cl
    WHERE 1<(SELECT COUNT(*) FROM comanda co WHERE co.cliecod = cl.cliecod)
    ORDER BY cl.cliecod; 
    ```

    </details>

