# Mappe

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

### sketch_04_displayData
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

## TODO
* Visualizzazione dei dati per ciascuna provincia -> Bar Graph per evidenziare differenze tipologie
* Variazioni sketch_04_displayData: map valori su colore anziché dimensione
* Interazione con mouse: se mouseOver, disegnare Bar Graph in alto
* Interazione con mouse 2: se mouseOver, ingrandire cerchio e disegnare [PieChart](https://processing.org/examples/piechart.html) diviso per tipologie 
