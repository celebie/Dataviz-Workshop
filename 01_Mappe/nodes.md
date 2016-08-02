# Mappe
Fonte dati: [Elenco Strutture Ricettive del Veneto](http://dati.veneto.it/dataset/elenco-strutture-ricettive-del-veneto)

* CSV Data: Import, Read, Filter
* Processing: importare immagine
* Rappresentare dati su immagine
* Varie rappresentazioni partendo dagli stessi dati

## CSV Data

### sketch_00_readcsv
* Importazione del CSV in Processing, cartella "data"
* Funzioni .getRowCount() e .getColumnCount()
* Due esempi di looping dei dati della tabella

### sketch_01_readcsv
* Creazione variabili per facilitare accesso colonne CSV
* Introduzione classe IntDict() per filtrare i dati
* .sortValue() e .sortValueReverse()
* Debugging

### sketch_02_filterdata
* Creazione variabili per ciascuna provincia
* Creazione IntDict() per ciascuna provincia
* Filtraggio dei dati per provincia
* Debugging

### sketch_03_loadimage
* Creazione funzione getData();
* loadImage()

### sketch_04_displaydata
* Coordinate delle città
  * Verona: 190, 520
  * Vicenza: 320, 430
  * Padova: 400, 550
  * Rovigo: 420, 660
  * Venezia: 540, 530
  * Treviso: 500, 380
  * Belluno: 480, 200
* Funzione map()
* Dimensione dei cerchi mappata.

### sketch_05_displaydata
Variazione sullo sketch precedente: i dati vengono riportati come variazione di colore e non come grandezza dell'ellisse
* Creazione funzione displayData();
* lerpColor() -> esempio con valori HSB
* norm() -> Normalizza un numero in un range in un valore compreso tra 0 e 1

### sketch_06_displaydata
Aggiunta BarGraph per rappresentare tutto il veneto
* keyArray()
* titolo

### sketch_07_piechart
Riprendendo lo sketch_04_displaydata, ora i dati di ciascuna regione vengono visualizzati in un grafico a torta. C'è un grosso problema per la scelta ideale dei colori essendo rappresentati molti dati. Alla fine ho usato il tool [ColorBrewer](http://colorbrewer2.org).
* [PieChart](https://processing.org/examples/piechart.html) diviso per tipologie e città.
* Miglioramento del codice: getColor(), pieChart()
* Inserimento della legenda
* displayData più chiara e semplice

### sketch_08_piechart_interactive
Evoluzione dello sketch_04_displaydata e dello sketch_07_piechart; versione interattiva.
* Interazione con mouse: se mouseOver, disegnare Bar Graph in alto
* Visualizzazione dei dati per ciascuna provincia -> Bar Graph per evidenziare differenze tipologie
