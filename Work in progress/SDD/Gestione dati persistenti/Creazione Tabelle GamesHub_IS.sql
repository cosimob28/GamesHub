create schema GamesHub;

use GamesHub;

create table Utente(
Username varchar(30) primary key,
Pin varchar(250) not null,
Nome varchar(20) not null,
Cognome varchar(20) not null,
DataNascita date not null,
codiceFiscale char(16) not null,
Telefono char(12),
Email varchar(30) not null,
IndirizzoSpedizione varchar(50) not null,
Sesso varchar(8) not null,
Tipo varchar(35) not null,
DataInvioMail date not null,
Verificato boolean default 0,
HashText varchar(250)
);




create table Ordine(
IdOrdine integer Primary key auto_increment,
Importo float not null,
Spedizione int not null,
DataOrdine date not null,
Stato varchar(20) not null,
Indirizzo varchar(60) not null,
TrackingId varchar(100),
Utente varchar(30) not null,
foreign key (Utente)  references Utente(Username)
);


create table Gioco(
SerialNumber integer Primary key,
Nome varchar(200) not null,
Prezzo float not null,
PEGI integer not null,
Genere varchar(30) not null,
Descrizione varchar(4000) not null,
Anno integer not null,
Piattaforma varchar(150) not null,
Video varchar(500) not null,
Quantità integer not null
);



create table Composizione(
Costo float not null,
Quantità integer,
Ordine integer not null,
Gioco integer not null,
NomeGioco varchar(200) not null,
Immagine varchar(100),
foreign key (Ordine) references Ordine(IdOrdine),
foreign key (Gioco)  references Gioco(SerialNumber)
);


create table Immagine(
Nome varchar(1000) Primary key,
Gioco integer not null,
foreign key (Gioco)  references Gioco(SerialNumber) on delete cascade

);


create table Carta(
NumeroCarta varchar(50) Primary key,
Cvv char(4) not null,
Scadenza char(6) not null,
Saldo long not null,
Utente varchar(30),
foreign key (Utente)  references Utente(Username)
);







/*Utenti*/
insert into Utente(Username,Pin,Nome,Cognome,DataNascita,codiceFiscale,Telefono,Email,IndirizzoSpedizione,Sesso,Tipo,DataInvioMail,Verificato)
values('root','root','Admin','Admin','1990-01-10','ADM','0000000000','admin@gameshub.it','via Giovanni Paolo II, Fisciano','Uomo','Gestore catalogo','2018-02-10',1);

insert into Utente(Username,Pin,Nome,Cognome,DataNascita,codiceFiscale,Telefono,Email,IndirizzoSpedizione,Sesso,Tipo,DataInvioMail,Verificato)
values('Luca1988','c971ff55c78282b514b8e90cd818400b','Luca','Marini','1988-01-10','MRNLCA25L18G856S','3425012563','lucaMarini@gmail.com','via Lauro 24, Napoli ','Uomo','cliente','2019-02-05',1);

insert into Utente(Username,Pin,Nome,Cognome,DataNascita,codiceFiscale,Telefono,Email,IndirizzoSpedizione,Sesso,Tipo,DataInvioMail,Verificato)
values('Franco1995','440cc7b643711a044bb78433a449028d','Francesco','Bianchi','1995-05-24','RSSFRN97O25F789H','3882450821','francesco@live.it','via Matteotti 98, Roma','Uomo','cliente','2019-02-05',1);

insert into Utente(Username,Pin,Nome,Cognome,DataNascita,codiceFiscale,Telefono,Email,IndirizzoSpedizione,Sesso,Tipo,DataInvioMail,Verificato)
values('Laura1980','1b3c7ec16f9186923b9d943f6c7130ea','Laura','Verdi','1980-03-11','VRDLRA80C51F205B','3206576122','verlaura@live.it','via Rossini 22, Milano','Donna','cliente','2019-02-04',1);
/*Giochi*/

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (1,'Deus Ex',15.38,18,'Azione',"Nel gioco vestirai i panni di Adam Jensen, un ex membro della SWAT, 
scelto per proteggere i segreti di una delle società biotecnologiche più sperimentali degli Stati Uniti.
Quando una squadra dei servizi segreti fa irruzione nel complesso, uccidendo gli scienziati che avresti dovuto proteggere, 
tutto ciò che credevi di conoscere sul tuo lavoro cambia.
Dopo essere rimasto gravemente ferito durante l'attacco, non hai altra scelta che farti innestare dei potenziamenti meccanici prima di metterti in viaggio per il mondo alla ricerca di indizi sull'accaduto, senza mai sapere di chi poterti fidare. In un'epoca nella quale i progressi della scienza stanno trasformando atleti, soldati e spie in esseri superdotati, c'è chi trama nell'ombra per fare in modo che l'evoluzione della specie umana segua un cammino già tracciato.
A te il compito di scoprire dove porta questo cammino, il cui percorso verrà influenzato dalle decisioni che prenderai e dalle scelte che farai.
Un futuro prossimo ricco di contraddizioni. Scopri un'era caratterizzata da un enorme progresso tecnologico, ma anche da disordini e cospirazioni. I potenziamenti meccanici del corpo umano hanno diviso la società in due: chi ha accesso agli impianti e chi non se li può permettere. Nel frattempo, forze opposte cospirano nell'ombra per controllare il destino dell'umanità: una rivoluzione umana è in arrivo.
Un perfetto mix fra azione e gioco di ruolo. Una combinazione unica di combattimenti ravvicinati carichi d'azione e intensi scontri a fuoco, arricchita da un'ampia gamma di potenziamenti per il personaggio e per le numerose armi a sua disposizione. Sblocca nuove capacità e migliora le tue abilità furtive, sociali, di hacking o di combattimento. Affronta il gioco come preferisci e determina l'evoluzione del tuo personaggio di conseguenza. Ogni stile e approccio al gioco portano a diverse ricompense.
Scelte e conseguenze. Fatti largo tra i nemici armi in pugno, striscia alle loro spalle silenziosamente, viola i sistemi per recuperare dati importanti 
o usa le tue abilità sociali per ottenere le informazioni che ti servono dai personaggi chiave. C'è sempre possibilità di scelta, con diversi tipi di 
approcci, percorsi e strumenti a tua disposizione.", 2010, 'PC', 'https://www.youtube.com/watch?v=Kq5KWLqUewc',5);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (2,'PES 18',24.58,3,'Sport', "Dove nascono le leggende' è lo slogan che accompagna il ritorno di PES, con nuove caratteristiche, 
modalità e una esperienza di gioco senza precedenti. La versione di quest’anno rappresenta il più grande cambiamento intrapreso dalla serie nell’ultima decade, con l’obiettivo di definire un nuovo standard qualitativo per i giochi di calcio, e alzare le aspettative per il futuro della serie.
PES 2018 è stato rivisto in tutti gli aspetti, offrendo un nuovo modo di giocare grazie ad una serie di miglioramenti nella giocabilità, Co-op Online, Selezione Partita Casuale, e una completa revisione della presentazione del gioco con i modelli dei giocatori riproposti perfettamente rispetto alle controparti reali, nuovi menu e le immagini reali dei calciatori.
PES 2018 supporta il mondo dell’eSport grazie alla nuova integrazione di PES League in diverse modalità Online, incluse la nuova modalità 3 contro 3 competitiva che permetterà agli utenti di unire le forze per vincere premi importanti. Questo, e il fatto di avere una versione PC con una qualità all’altezza della versione PS4, sono solo alcuni dei grandi cambiamenti che ci attendono in PES 2018.
GIOCABILITA’ AI MASSIMI LIVELLI
La rinomata qualità del gameplay è stata ulteriormente raffinata e bilanciata per ricreare l'autenticità di questo meraviglioso sport, inclusa una velocità di gioco più realistica. Il Dribbling Strategico permette all'utente di avere un maggior controllo nella fase di possesso, con la possibilità di una migliore protezione della palla, permettendo con il semplice uso della levetta di ottenere realistici e precisi movimenti per ingannare l'intervento del difensore. Real Touch+ aggiunge una nuova dimensione al controllo della palla, con la possibilità di gestirla con tutto il corpo permettendo tocchi con diverse zone dello stesso in base al movimento imprevedibile del pallone. I calci piazzati sono stati rinnovati con un nuovo sistema di punizioni e rigori, insieme all'opzione di scegliere il nuovo sistema del calcio di avvio con un solo giocatore.
ESTETICA MIGLIORATA
Nuova Interfaccia Utente per tutti i menu e utilizzo delle immagini reali di giocatori per le schermate di selezione e per il myClub, 
così come una nuova presentazione in-game in stile televisivo.", 2018, 'XboxOne', 'https://www.youtube.com/watch?v=YkPOHXRzBII',25);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (3,'F1 2017',24.58,3,'Sport',"SCRIVI LA STORIA.Vinci il Campionato del Mondo 2017, batti ogni record con le auto F1™ più veloci di sempre 
e gareggia con alcune delle auto F1 più iconiche degli ultimi 30 anni. Con una Carriera ancora più estesa di 10 anni, diverse varietà di gameplay 
nella nuova modalità ‘Championships’ e una serie di nuove caratteristiche, sia online che offline, F1 2017 è il più completo ed emozionante videogioco 
di sempre, dedicato alla F1. CARRIERA PIÙ COMPLETA.
La modalità Carriera estesa permette ai giocatori di fare la storia della F1 mentre migliorano le loro abilità e sviluppano la propria vettura nel corso di varie stagioni. Approfondisci le funzionalità del nuovo sistema di gestione dei veicoli che richiede al giocatore di bilanciare le risorse per migliorare le prestazioni, mantenere la vettura affidabile ed evitare penalità sulla griglia di partenza.
Gestisci i sei componenti chiave che compongono una power unit di F1 moderna. Lavora con la tua squadra per migliorare i tempi al pit stop, velocizzare i processi di Ricerca e Sviluppo e rendere più affidabili i nuovi componenti.
Ci sono anche nuovi programmi di prova per imparare a guadagnare punti risorsa, dalla 'Gestione carburante' e dal 'Ritmo gara'. In modalità Carriera ci sono inoltre delle fantastiche località, aggiornate e nuove, per espandere tutti gli eventi che avvengono fuori pista. Anche le vetture classiche tornano al centro dell’attenzione nella modalità Carriera estesa, permettendoti di guidarle nei nuovi 'eventi Invitational'.
Altri miglioramenti alla modalità Carriera del nuovo gioco includono, per la prima volta, l’aggiunta di avatar femminili, 
nuovi caschi disegnati dai vincitori del contest della community, la possibilità di cambiare il numero dell’auto e il design del casco durante 
la stagione e l’opzione richiesta a gran voce, di poter assegnare il prestigioso numero 1 alla tua vettura di Carriera, in caso di vittoria del 
Campionato piloti.", 2017, 'PS4', 'https://www.youtube.com/watch?v=pvQAYiGSa0M',25);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (4,'Call Of Duty WW2',58.18,18,'Azione', "Call of Duty® torna alle sue radici con Call of Duty®: WWII, 
un'esperienza mozzafiato che porterà una nuova generazione nella Seconda Guerra Mondiale. Sbarca in Normandia durante il fatidico D-Day e combatti in tutta Europa rivivendo leggendarie battaglie che hanno segnato il conflitto più sanguinoso della storia. Scopri il classico combattimento di Call of Duty, i legami del cameratismo e il cuore crudele della guerra.
LA CAMPAGNA DEFINITIVA NELLA SECONDA GUERRA MONDIALE--Scopri la storia di un indivisibile gruppo di uomini comuni che combattono per difendere la libertà in un mondo minacciato dalla dittatura.
MULTIGIOCATORE DURO E PURO--Il multigiocatore di Call of Duty: WWII cala i giocatori nelle battaglie più aspre e intense che hanno segnato la Seconda Guerra Mondiale. Interagisci e socializza con i tuoi amici e l'intera community di Call of Duty usando funzioni innovative.
UN'ESPLOSIVA MODALITÀ COOPERATIVA--La modalità cooperativa di Call of Duty: WWII offre una nuova storia originale. 
Affronta insieme ai tuoi amici una rivoluzionaria modalità indipendente ricca di adrenalina e imprevisti.", 2018, 'PS4', 'https://www.youtube.com/watch?v=EqX_aBx1Qic',25);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (5,'Far Cry 5',36.87,18,'Avventura',"Far Cry sbarca in America con il nuovo capitolo della pluripremiata serie. Ecco Hope County, Montana, terra dei liberi, patria dei coraggiosi... e della setta apocalittica Eden’s Gate. Affronta il capo spirituale Joseph Seed e i suoi fratelli, gli Araldi: accendi il fuoco della ribellione e libera una comunità sotto assedio.
Libera Hope County in modalità a un giocatore o in due. Recluta mercenari e addestra animali per sconfiggere la setta. Semina il caos nella setta, ma occhio a non far infuriare Joseph Seed e i suoi seguaci.
Crea il personaggio e scegli la tua avventura nel capitolo più personalizzabile di Far Cry. Guida famose muscle car, quad, aerei e molto altro mentre affronti le truppe della setta in scontri epici.", 2018, 'PS4', 'https://www.youtube.com/watch?v=RARURPrkBqc',25);


insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (6,'Assassin''s Creed Origins',32.69,18,'Avventura',"*Il Discovery Tour by Assassin's Creed®: Antico Egitto è ora disponibile come aggiornamento gratuito!* Lo splendore dell antico Egitto volge al tramonto in una spietata lotta per il potere. Svela oscuri segreti e miti dimenticati tornando dove tutto ebbe inizio:
la nascita della Confraternita degli Assassini. Naviga sul Nilo, svela i misteri delle piramidi e affronta le antiche fazioni e gli animali selvatici che popolano un territorio immenso e pieno di sorprese.
Affronta missioni avvincenti animate da personaggi indimenticabili. Incontra facoltosi nobili e reietti disperati.
Scopri un nuovo modo di combattere. Raccogli bottini e usa decine di armi diverse, con caratteristiche e livello di rarità differenti.
Gestisci la progressione del personaggio e metti alla prova le tue abilità nei combattimenti contro potenti boss", 2017, 'XboxOne', 'https://www.youtube.com/watch?v=cK4iAjzAoas',25);


insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (7,'Just Dance® 2018',49.17,3,'Sport'," Non importa da dove vieni, quanti anni hai, se sei un panda o una carota: alza il volume e preparati a scatenare la tua voglia di ballare, perché Just Dance 2018 risveglierà il ballerino che c’è in ognuno di noi! Il più popolare franchise videoludico musicale di sempre*, con oltre 63 milioni di unità vendute** tornerà questo autunno. 
Che tu sia un festaiolo, un ballerino in carriera o un professionista in cerca di nuove sfide, in Just Dance... ballare non è mai stato così facile!
Entra in una community di oltre 118 milioni di giocatori in tutto il mondo e sfodera le tue mosse migliori! Balla al ritmo travolgente di 24K Magic
di Bruno Mars, Side to Side di Ariana Grande con Nicki Minaj, The Way I Are (Dance With Somebody) di Bebe Rexha con Lil Wayne e Chantaje di Shakira
con Maluma. Rivivi alcuni classici, tra cui Daddy Cool di Groove Century, 
o se la tua specialità è il K-Pop, allora non perderti Bubble Pop di Hyuna!", 2018, 'Nintendo switch','https://www.youtube.com/watch?v=xR1xPDGxslU',15);
 
 
insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (8,'Sid Meier''s Civilization VI',29.87,12,'Strategia', "Originariamente creato dal leggendario Sid Meier, Civilization è un gioco strategico 
a turni in cui l'obiettivo è costruire un impero in grado di superare la prova del tempo. Diventa il dominatore del mondo, conducendo la tua civiltà 
dall'età della pietra a quella dell'informazione! Combatti, tratta con diplomazia, sviluppa la tua cultura e sfida i più grandi leader della storia per
 dare vita alla civiltà più grandiosa che il mondo abbia mai conosciuto. Civilization VI offre nuove modalità di interazione con il mondo: le città ora 
 si espandono fisicamente sulla mappa, mentre le ricerche attive in campo tecnologico e culturale sbloccano nuove potenzialità. 
 Intanto i leader avversari portano avanti i loro programmi, basati sulle caratteristiche dei personaggi storici: il risultato è una corsa per 
 raggiungere una delle cinque diverse condizioni di vittoria del gioco.", 2016, 'PC','https://www.youtube.com/watch?v=5KdE0p2joJw',10);


insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (9,'Final Fantasy XV',33.43,16,'RPG', "FINAL FANTASY XV è un innovativo fantasy ispirato alla realtà, con uno stile di gioco rivoluzionario, 
una grafica spettacolare e una tecnologia di ultima generazione. In fuga dalla guerra che sta devastando il regno di Lucis, il principe Noctis parte 
per un epico viaggio insieme ai suoi migliori amici in un mondo pieno di mostri spettacolari, meravigliosi paesaggi e dungeon pieni di pericoli nella 
speranza di trovare la forza per riconquistare la sua patria e mettere fine al conflitto.
Uno scenario open world tutto da esplorare: viaggia dalla capitale percorrendo strade secondarie al volante della tua auto, o spostati a piedi per 
scoprire un fantastico paesaggio naturale, profonde e pericolose caverne piene di antichi tesori e nuove città in cui ti aspettano tante avventure.
Una storia di amicizia: nei panni di Noctis sentirai crescere il legame di amicizia con i tuoi compagni di viaggio man mano che prosegui nel tuo viaggio. Sferra potenti attacchi coordinati e sfrutta il lavoro di squadra di Noctis e i suoi amici.
Intense battaglie: personalizza le tue armi e usa le abilità uniche di ciascun personaggio in battaglie in tempo reale. Spostati sul campo di battaglia 
mettendo a segno colpi strategici, mosse speciali e lanciando potenti incantesimi.", 2018, 'PC','https://www.youtube.com/watch?v=ZFFmieoN-DM',20);


insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (10,'LEGO Gli Incredibili',49.98,7,'Azione', "LEGO Gli Incredibili è la straordinaria e divertentissima avventura che ti farà vestire i panni dei personaggi de 
Gli Incredibili che ti piacciono di più. Fai squadra assieme al resto dei Parr, la famiglia di supereroi, per sconfiggere il crimine e rivivi i
 tuoi momenti preferiti dei film Gli Incredibili e Incredibili 2 in formato LEGO!Collabora in famiglia per vincere
Combina le mitiche abilità e i poteri unici della famiglia Parr per costruire fantastiche e gigantesche strutture LEGO. Con l'impareggiabile forza di 
Mr. Incredible, le trasformazioni flessibili di Elastigirl e le impressionanti abilità del resto del team, il lavoro di squadra non è mai stato 
così divertente. Combatti il crimine un distretto alla volta
Per liberare la città dal crimine, completa le missioni frenetiche e sconfiggi i supercriminali che controllano i distretti della città di un 
Open World che include Municiberg. Goditi una nuovissima ed eccitante esperienza di gioco più libera che mai! Personalizzazione dei personaggi con un tocco in più
Modifica l'aspetto del tuo personaggio e delle sue abilità usando un sistema di personalizzazione in stile Edna 'E' Mode, la piccola ma esplosiva stilista dei costumi da supereroe.", 2018, 'Nintendo switch','https://www.youtube.com/watch?v=JMc5o9eGfI0',15);


insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (11,'Pokémon Let''s Go,Pikachu!',49.98,7,'RPG',"Un nuovo emozionante RPG Pokémon per Nintendo Switch! Pokémon: Let's Go, Pikachu! e Pokémon: Let's Go, Eevee! 
portano su Nintendo Switch l'esperienza di un classico RPG Pokémon con una fantastica grafica HD e uno stile di gioco adatto a chi si avvicina alla serie
Pokémon per la prima volta, ma allo stesso tempo profondo abbastanza da mettere alla prova anche gli Allenatori più esperti.
Questi nuovi titoli consentono anche di giocare in due e di vivere quindi l'avventura in compagnia di un altro giocatore.
 Inoltre, esiste un legame profondo tra Pokémon: Let's Go, Pikachu!, Pokémon: Let's Go, Eevee! e Pokémon GO, quindi i fan del popolarissimo gioco 
 per dispositivi mobili troveranno molti modi per divertirsi ancora di più. Un modo tutto nuovo di catturare i Pokémon!
La Poké Ball Plus (venduta separatamente) è un dispositivo a forma di Poké Ball che in Pokémon: Let's Go, Pikachu! e Pokémon: Let's Go, Eevee! 
può essere usato per giocare al posto dei Joy-Con. Grazie ad essa, potrai lanciare Poké Ball nel gioco con un semplice movimento del polso!
Oltre ad avere un sensore di movimento, questo dispositivo si illumina di vari colori, vibra ed emette dei suoni.
Con la Poké Ball Plus potrai anche portare uno dei tuoi Pokémon preferiti di questi giochi a fare una passeggiata con te nel mondo reale.
 L'accessorio può fungere anche da Pokémon GO Plus quando giochi a Pokémon GO.", 2018, 'Nintendo switch','https://www.youtube.com/watch?v=UnU2InYRDyA',15);


insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (12,'Injustice 2',20.31,16,'Picchiaduro', "Crea e potenzia la versione definitiva delle tue leggende DC preferite in INJUSTICE 2.
Con una scelta immensa di supereroi e supercriminali DC, INJUSTICE 2 ti permette di equipaggiare ogni singolo personaggio leggendario con attrezzature uniche e potenti ottenute nel corso del gioco. Sperimenta un livello di controllo senza precedenti sull'aspetto dei tuoi personaggi preferiti, sul loro modo di lottare e di svilupparsi fra le diverse modalità di gioco. Questo è il tuo supereroe. La tua avventura. Il tuo Injustice.
FORGIATO DAL CAMPO DI BATTAGLIA: ogni incontro ti permette di ottenere nuovi equipaggiamenti e di personalizzare e incrementare di livello i tuoi lottatori DC preferiti, plasmandone aspetto e capacità. UNA
NUOVA MINACCIA: mentre Batman e i suoi alleati proseguono lo scontro con il regime di Superman, emerge una nuova minaccia che mette a repentaglio il futuro della Terra...
IL MEGLIO DI DC COMICS: scegli tra nuovi personaggi e grandi ritorni con 
il cast DC più completo di sempre.", 2017, 'PS4','https://www.youtube.com/watch?v=oDav-JfidL0',20);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (13,'MXGP Pro',41.79,3,'Sport',"Crea il tuo rider e inizia la scalata verso il successo nella modalità Carriera. 
Salta nel Compound, un’area più grande con diversi tipi di terreno. Testa le tue abilità in 30 diverse Attività: una modalità di gioco che ti permetterà di apprendere e affinare le tue tecniche. Tutto questo e molto, molto altro.
DIVENTA UN PRO. Tutta l’esperienza del motocross da vivere come un professionista. Potrai infatti regolare l’assetto della tua moto come un vero meccanico dando prova delle tue conoscenze su sospensioni, freni o sulla mappatura dell’acceleratore per rendere unico il tuo feeling di guida.
IL VIDEOGIOCO UFFICIALE.Tutta la stagione 2017, le piste e i piloti della MXGP e MX2 ti aspettano più reali che mai grazie al nuovo sistema di riproduzione fotogrammetrica degli ambienti e alla scansione dei volti in 3D.
MIGLIORIE TECNICHE.Un design della fisica completamente rivisto per una resa più integrata dei comportamenti di moto e pilota che ti permetteranno di vivere un’esperienza di gameplay molto più libera, sfidante e reale.
COMPOUND ENORME.Una vasta area di allenamento da esplorare in totale libertà e in cui esercitarti senza limiti di 
tempo districandoti in diverse condizioni di terreno, dai percorsi pianeggianti ai terreni più accidentati. 
Il luogo ideale per tutti gli amanti di cross!", 2017, 'PC', 'https://www.youtube.com/watch?v=abEj7oZVO6A',15);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (14,'Watch Dogs 2',20.31,18,'Azione', "L’hacking si trasforma nella tua arma principale nell’open world coinvolgente e dinamico di Watch Dogs 2.
Nel 2016, il ctOS 2.0, un sofisticato Sistema Operativo che gestisce l’infrastruttura cittadina, è ormai implementato in diverse città degli Stati Uniti con lo scopo di creare metropoli più sicure ed efficienti.
Gioca nei panni di Marcus Holloway, un giovane e brillante hacker che vive nella culla della rivoluzione tecnologica: la baia di San Francisco. Unisciti a Dedsec, un famigerato gruppo di hacker, e rivela il pericolo che si cela dietro il ctOS 2.0 che, nelle mani di organizzazioni corrotte, viene utilizzato in maniera illegale per monitorare e manipolare i cittadini su larga scala.
Con la potenza dell’hacking e Dedsec dalla tua parte, darai il via all’Hack del Secolo, annientando il ctOS 2.0 e restituendo la libertà a chi davvero la merita: i cittadini.
BENVENUTI NELLA BAIA DI SAN FRANCISCO.
Esplora un open world enorme e dinamico che ti offrirà un’incredibile varietà di possibilità di gioco. Fatti strada nel traffico grazie alle tue abilità di hacker mentre sei coinvolto in pericolosi inseguimenti tra le strade ventose di San Francisco, oppure attraversa i tetti dei vivaci e vibranti dintorni di Oakland, o ancora infiltrati negli uffici delle innovative aziende della Silicon Valley. Ci sono innumerevoli segreti da svelare nella culla della rivoluzione tecnologica.
LA TUA ARMA È L’HACKING.
Hackera l’infrastruttura della città, ogni dispositivo connesso e i dati personali di ogni cittadino. Prendi il controllo di droni, auto, 
gru, robot di sicurezza e molto altro ancora. Hackera i tuoi nemici così come i passanti – manipola i dati in vari modi per scatenare 
un’imprevedibile catena di eventi. Ogni persona, ogni veicolo, 
ogni dispositivo posseduto, potrà essere hackerato", 2016, 'PS4','https://www.youtube.com/watch?v=S379QqBhk5Q',10);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (15,'MotoGP 18',41.79,3,'Sport', "ESPERIENZA SIMULATIVA COMPLETAMENTE NUOVA.Immergiti nel realismo di MotoGP™18 grazie a nuove tecnologie all’avanguardia
GRAFICA.Unreal Engine 4
Un salto avanti sia in termini di grafica che di gameplay 3D Scan
Volti e moto incredibilmente dettagliati Drone Scanning
Riproduzione 1:1 di ciascun tracciato MotoGP™. FISICA.Fisica, AI, Sistema di collisioni
Confrontati contro gli avversari più agguerriti che mai, e evita le collisioni: ognuna di esse diminuirà la performance della tua moto.
Aiuti di guida. Per un’esperienza più godibile, indipendemente dal tuo livello di abilità.
Sistema di danni scalabile.Ogni impatto influirà sull’estetica della tua moto, oltre che sulla sua guidabilità.
Gestione degli pneumatici. Impara a scegliere lo pneumatico più giusto e tieni conto della temperatura e del consumo.
Sviluppo e setup della moto. Collezione i pacchetti sviluppo e usali per migliorare la tua moto. Motore, sospensioni, freni, chassis e aerodinamica. Ognuno influenzerà la tua performance.
TRACCIATI. Corri al Massimo della velocità sul circuito di Misano, o affronta la curva più veloce di Indianapolis. Ogni tracciato porterà le proprie difficoltà e caratteristiche direttamente sullo schermo della tua TV.
SINGLE PLAYER. Carriera Parti come un “rookie” e scala tutte le classifiche dalla Red Bull MotoGP™ Rookies Cup fino alla Moto GP™.
Single Race.Agguanta il pad e affronta una vera gara di MotoGP™ in pochi secondi.
Championship.Crea la tua personale competizione, con le tue regole. Scegli categoria, pilota, tracciati, numero di gare e giri.
Time Attack. Conosci ogni tracciato come le tue tasche e mettiti alla prova battendo il tuo stesso record. Scarica il ghost degli altri giocatori e scopri se ne sei all’altezza.
MULTIPLAYER. Chi è il migliore? Corri contro altri giocatori e scoprilo in questa modalità. MotoGP™ eSport Championship", 2018, 'PC', 'https://www.youtube.com/watch?v=7lVysaWdXAY',25);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (16,'Tekken 7',33.59,16,'Picchiaduro', "Amore, vendetta, orgoglio: ognuno di noi ha un motivo per combattere. I valori sono ciò che ci 
definiscono e che ci rendono umani, a prescindere da forze e debolezze. Non ci sono motivazioni sbagliate, solo la strada che decidiamo di intraprendere.
Seguite l'epica conclusione della guerra dei Mishima e scoprite i motivi dietro a ogni scontro. Sviluppato con Unreal Engine 4, Tekken 7,
vi offrirà una storia con incredibili battaglie cinematografiche e momenti intensi da godervi in compagnia degli amici.
UNA STORIA SENZA INTERRUZIONI - Sequenze cinematografiche di incredibile qualità si fondono perfettamente con feroci battaglie che raccontano 
l'emozionante storia della famiglia Mishima in maniera davvero innovativa.
OLTRE 30 PERSONAGGI GIOCABILI - Un nutrito gruppo di oltre 30 personaggi giocabili, inclusi lottatori del tutto nuovi, 
e un parco mosse tra i più imponenti mai visti in un picchiaduro garantiscono completa libertà di combattimento. Trovate le tecniche letali, i colpi di arti marziali e le combo che preferite e vincete lo scontro!", 2018, 'PS4','https://www.youtube.com/watch?v=YR7iKFITTWY',15);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (17,'Lords of the Fallen',17.20,16,'RPG', "Nell'Era degli Antichi, il Mondo era governato da un Dio malvagio, 
che schiavizzò l'intero genere umano. Col tempo, la paura degli oppressi mutò in rabbia e in ribellione, fino a scatenare la 
Grande Insurrezione e alla guerra per la libertà. Dopo una gloriosa vittoria, grazie alla quale venne scacciato il Dio Caduto, 
gli Umani stabilirono un nuovo ordine... un mondo in cui nessun peccato avrebbe mai ottenuto il perdono e la redenzione era impossibile.
Ora, millenni dopo, il pianeta trema di nuovo dalla paura; la legione demoniaca dei Rhogar è tornata dalla dimensione oscura, 
guidata da un'insana fame di spiriti innocenti. Come ultimo gesto disperato, l'umanità invoca l'aiuto di un improbabile difensore: 
un peccatore incallito, scacciato dalla società e allontanato dalla luce... un uomo di nome Harkyn. Insieme al suo mentore, Kaslo, 
si metterà in viaggio per raggiungere l'origine delle tenebre... e affrontare i Lord del Caduto.
Tuffati in un RPG mozzafiato, dotato di un complesso e gratificante sistema di combattimenti corpo a corpo: armi, 
armature e abilità influenzano direttamente la velocità e gli attacchi dei nemici. Se tutto il resto fallisce, devasta gli avversari 
usando la magia proibita.Imbarcati in una missione epica, che ha luogo nella dimensione degli Umani e in quella dei demoni.
Affronta i possenti Lord, i generali dell'esercito dei Rhogar.Esplora un grande e oscuro mondo fantasy.
Rifletti sulle tue scelte, potrebbero influenzare il tuo destino.Utilizza un vasto arsenale di armi e armature leggendarie.
Scegli la tua classe, fra guerriero, chierico o ladro, e personalizza a fondo il tuo personaggio on armi e abilità.", 2018, 'XboxOne', 'https://www.youtube.com/watch?v=GXqaRhJNEAk',25);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (18,'Fallout 4',22.93,18,'Avventura',"Bethesda Game Studios, pluripremiati creatori di Fallout 3 e The Elder Scrolls V: Skyrim, 
vi danno il benvenuto nel mondo di Fallout 4, il loro gioco più ambizioso di sempre e la nuova generazione dei giochi in un mondo aperto.
Come unico sopravvissuto del Vault 111 devi affrontare un mondo distrutto dalla guerra nucleare. Ogni istante è una lotta per la sopravvivenza 
e ogni scelta spetta a te. Solo tu puoi ricostruire e definire il destino della Zona Contaminata. Benvenuto a casa.
Indipendenza e libertà! Fai tutto ciò che vuoi in un enorme mondo aperto con centinaia di località, personaggi e missioni. Diventa parte di numerose fazioni che lottano per il potere, oppure agisci in autonomia: hai tutta la libertà di scegliere.
Sei S.P.E.C.I.A.L! Diventa ciò che vuoi essere con il sistema S.P.E.C.I.A.L., da soldato con armatura atomica a oratore carismatico. Puoi scegliere fra centinaia di abilità extra e sviluppare uno stile di gioco tutto tuo.
Pixel superlussuosi! Un nuovissimo motore grafico di nuova generazione rende il mondo di Fallout vivo come non mai. Ogni località, 
dalle foreste devastate del Commonwealth alle rovine di Boston, è colma di dettagli dinamici.", 2015, 'XboxOne','https://www.youtube.com/watch?v=XW7Of3g2JME',10);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (19,'WWE 2K16',13.75,16,'Sport', "Raise Some Hell... Sali sul ring con WWE 2K16! Il campione indiscusso dei giochi di 
wrestling fa il suo ritorno sulla scena con il roster più ampio nella storia dei giochi WWE e il 'Texas Rattlesnake' Stone Cold Steve 
Austin in copertina! Gioca nei panni della tua Superstar preferita passata, presente o futura e prova il videogioco WWE più autentico, 
completo e sfrontato di sempre! Il roster piu' ambio nella storia dei giochi WWE
Il roster più ampio nella storia dei giochi WWE! Gioca con oltre 120 personaggi unici fra Superstar, Divas e Leggende WWE e NXT e molti altri. Raise Some Hell!
Dinamica di gioco perfezionata.Il sistema di wrestling di 2K16 è più fluido e reattivo che mai, con migliaia di nuove animazioni, miglioramenti alle mosse concatenate, nuove prese e nuovi contrattacchi per offrire l’esperienza WWE più divertente e autentica mai provata.
Rivivi e gioca alcuni degli scontri e dei momenti più epici di tutti i tempi nella campagna per giocatore singolo, 2K Showcase. Completa obiettivi per sbloccare personaggi leggendari, tenute, tipi di match e contenuti sbloccabili della storia della WWE.
Sfrutta l’impareggiabile Suite di creazione di 2K per sviluppare il tuo WWE Universe, incluse opzioni per la creazione e la personalizzazione di Superstar, Divas, arene, show, Titoli unici e molto altro. Carica le tue creazioni e condividile online con il WWE Universe!
Scrivi la tua storia in La mia CARRIERA affrontando match epici e compiendo scelte importanti mentre scali i ranghi da NXT alla WWE, 
per aggiudicarti il tuo posto nella Hall of Fame WWE. Allenati, affronta gli avversari e definisci il tuo personaggio con interviste 
basate sulla tua personalità e creando alleanze e rivalità.", 2016, 'PS3','https://www.youtube.com/watch?v=n5OgeEu0qzw',5);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (20,'LEGO Marvel Avengers',13.75,7,'Avventura', "Avengers riunitevi! Il franchise campione di vendita LEGO® Marvel ritorna 
con un nuova avventura supereroica ricca d’azione. Unisciti alla squadra dei LEGO® Marvel Avengers e sperimenta il primo gioco 
per console con i protagonisti e la storia dell’accamato film Marvel The Avengers, il blockbuster sequel di Avengers: Age of Ultron.
Gioca con i più potenti supereroi affrontando con loro la sfida per la salvezza del mondo. Un variegato roster di
personaggi Marvel – Gioca e sblocca più di 100 nuovi e vecchi personaggi con un ventaglio di straordinarie capacità, tra cui gli amati Hulk, Iron Man, Capitan America e Thor, nuovi personaggi tratti dal film Avengers: Age of Ultron e molti altri ancora.
Nuovi e avanzati poteri e abilità – Combatti in una nuova maniera con poteri avanzati e abilità tipiche di ogni personaggio. Fai squadra con gli Avengers per eseguire incredibili mosse combo.
Free Roamimg Gameplay Goditi il gameplay Open World di LEGO® Marvel Avengers vestendo i panni dei più potenti eroi della Terra per collezionare mattoncini d’oro, bottoni, e sbloccare personaggi aggiuntivi.
Una varietà di famose location – Visita le località più famose del cinematico universo Marvel sparse in tutto il mondo.
Sperimenta la straordinaria azione dei film degli Avengers – Rivivi i momentio chiave di The Avengers e Avengers: 
Age of Ultron, il tutto innaffiato dal classico umorismo LEGO.", 2016, 'PS3', 'https://www.youtube.com/watch?v=mBvhzBh5BZI&t=24s',10);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (21,'Dragon Ball Xenoverse',20.31,12,'Picchiaduro', "Le più dure battaglie di Goku e dei GUERRIERI stanno tornando!
Per la prima volta in assoluto, l'universo di DRAGON BALL sarà ricreato sulle console di nuova generazione e beneficerà delle caratteristiche delle più potenti console mai create.
DRAGON BALL XENOVERSE rivisiterà tutte le più famose battaglie della serie grazie ad Avatar, che è connesso a Trunks e a molti altri personaggi. Questa connessione e la sua volontà di partecipare agli scontri saranno sufficienti per non cambiare la Storia così come la conosciamo? In arrivo con fantastiche caratteristiche come la misteriosa Toki Toki City, nuove meccaniche di gameplay, animazioni dei personaggi e molte altre incredibili novità che saranno presto rivelate!
AVATAR – Un nuovissimo personaggio basato sui desideri dei giocatori. Scegli un Terrestre, un Majin, un Saiyan o un Namecciano e buttati sul campo di battaglia!
Nuove Generazione - divertiti il tuo manga preferito su PlayStation 4, Xbox One e Steam (PC)! Anche su PlayStation 3 e Xbox 360.
Gameplay Migliorato - scopri le veloci e imponenti battaglie che ti aspettano, incluse le trasformazioni in tempo reale!
Immersione totale - ispirato a una delle serie più famose mai create.
Un nuovo mondo: un orologio fermatosi molto tempo fa ricomincerà a ticchettare in una misteriosa e futuristica città!
Battaglie originali - partecipa a scontri epici contro nemici temibili come Vegeta, Frieza, Cell e molti altri!
Guerriero sconosciuto: osservalo insieme al suo scouter… chi sarà mai?", 2015, 'PS3', 'https://www.youtube.com/watch?v=9tOoBqXbxbU',5);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (22,'The Last of Us',33.59,18,'Azione', "E se fossi tu The Last of Us™?
Se il mondo che conoscevi venisse spazzato via, se il confine tra giusto e sbagliato tendesse a confondersi e se le scelte che determinano la vita o la morte si susseguissero ogni giorno, fino a che punto ti spingeresti per sopravvivere?
Per Joel la sopravvivenza è una lotta solitaria, ma quando Ellie irrompe nella sua vita, avrà inizio un viaggio attraverso ciò che resta degli Stati Uniti che metterà a dura prova l'umanità e la voglia di combattere di entrambi.
Lotta per la sopravvivenza in un mondo senza scrupoli. Esplora il fascino delle metropoli in rovina di un'America post-pandemica.
Combatti per la sopravvivenza online in intense partite multigiocatore.", 2015, 'PS3', 'https://www.youtube.com/watch?v=AaOWRvmtEFQ',5);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (23,'GTA V',41.79,18,'Azione', "Los Santos: un'enorme e soleggiata metropoli piena di sedicenti guru, attricette e celebrità 
sul viale del tramonto. Un tempo era l'invidia del mondo occidentale, ma ora è costretta ad arrangiarsi per restare a galla in un'epoca di incertezza economica e TV via cavo da quattro soldi.
In mezzo a tutto questo, tre criminali molto diversi tra loro si danno da fare per sopravvivere e realizzarsi, ognuno a modo suo: l'ambizioso Franklin è a caccia di soldi e di opportunità; Michael, un ex criminale professionista, sta facendo i conti con una 'pensione' meno rosea del previsto; e Trevor, un maniaco violento, pensa solo a farsi e al prossimo, grande colpo. I tre non hanno altra scelta: decidono di rischiare il tutto per tutto in una serie di colpi audaci e pericolosi che potrebbero sistemarli per la vita.
Con il più grande, il più dinamico e il più vario mondo di gioco mai creato, Grand Theft Auto V mescola sapientemente storia e gioco in modi del tutto nuovi, con i giocatori intenti a passare da una vita all'altra dei tre protagonisti e a vivere l'intreccio delle loro avventure.
Ritornano tutti gli elementi distintivi tipici della serie, compresa l'incredibile attenzione ai dettagli e il pungente umorismo di Grand Theft Auto, oltre che un nuovo e ambizioso approccio al mondo di gioco in multiplayer.
Los Santos & Blaine County.Il mondo di Grand Theft Auto V (di gran lunga il più grande visto finora) è completamente accessibile fin dall'inizio e unisce zone molto distanti tra loro, sia dal punto di vista geografico che da quello culturale. I visitatori della metropoli di Los Santos e della rurale Blaine County incontreranno celebrità in declino, drogati, festaioli, bande violente, escursionisti, motociclisti e ogni tipo di curioso abitante. Sarete in grado di spostarvi ovunque, dalla cima delle montagne alle strade di Los Santos e persino nelle profondità dell'oceano.
I tre protagonisti giocabili, Michael, Franklin e Trevor potranno anche vivere in zone diverse della città, 
avere i loro problemi, caratteri, stili di vita, desideri e obiettivi, ma il lavoro di squadra è il loro forte: 
ognuno aggiunge le sue abilità uniche alla riuscita del colpo.", 2014, 'PS4', 'https://www.youtube.com/watch?v=UWzV0AFXukI',15);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (24,'The Sims 4 Stagioni',33.59,12,'Simulazione', "Introduci il clima nelle vite dei tuoi Sims per raccontare storie nuove, scoprire attività 
stagionali e celebrare le festività che più ti stanno a cuore con The Sims™ 4 Stagioni. Approfitta al massimo del clima tutto l'anno, dalle nevicate 
gelide al caldo soffocante. Ogni scenario viene influenzato dalle stagioni in modo diverso. Crea una storia invernale con il pattinaggio su ghiaccio, fai amicizia con uno spaventapasseri magico durante la mietitura autunnale, vivi un amore primaverile durante un temporale, oppure organizza una festa estiva in piscina. Raduna amici e familiari per celebrare le festività con tanto di tradizioni, regali e ospiti d'onore. Tieniti al caldo o al fresco con i nuovi abiti adatti a ogni situazione atmosferica. Puoi anche intraprendere una fiorente carriera nel giardinaggio come botanico o realizzando composizioni floreali!
Vivi gli effetti del clima. Scopri le meraviglie delle quattro stagioni e del clima in continuo mutamento che influenza ogni aspetto delle vite dei tuoi Sims. Dal caldo e soleggiato al burrascoso e innevato, il clima di ogni scenario è diverso da tutti gli altri e influisce nelle attività quotidiane, nelle relazioni e nelle scelte dei Sims. Controlla gli elementi atmosferici per scatenare nubifragi, diradare le nubi nel cielo o passare da una stagione all'altra.
Divertiti con le attività stagionali. Le attività che si svolgono nell'arco dell'anno offrono ai Sims opportunità allegre e 
simpatiche di godersi le stagioni. Copriti bene per costruire un pupazzo di neve con gli amici, creare angeli di neve o eseguire 
fantastiche evoluzioni sulla pista da pattinaggio. Mettiti un impermeabile per goderti la pioggia primaverile ed esplora i dintorni 
per guadagnare distintivi come scout. Vesti i Sims con i nuovi costumi da bagno per farli rinfrescare con l'irroratore o giocare nella piscina 
per bambini. Raccogli il miele in autunno, gioca tra le foglie o fai realizzare 
oggetti festivi ai Sims in tenera età.", 2018, 'PC', 'https://www.youtube.com/watch?v=WlK6yK5P34M',20);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (25,'Total War ROME II',28.67,16,'Strategia', "COSA SEI DISPOSTO A FARE PER ROMA?
La pluripremiata serie Total War torna a Roma, con l’intenzione di stabilire un nuovo standard per i giochi di strategia. Diventa la prima superpotenza del mondo e guida la più incredibile macchina da guerra del mondo antico. Domina i tuoi nemici attraverso la guerra, l'economia e la politica. La tua ascesa ti procurerà ammirazione e invidia, anche da parte dei tuoi alleati più fedeli.
Subirai il tradimento o sarai tu a rivoltarti contro i vecchi amici? Combatterai per salvare la Repubblica o cercherai di regnare da solo diventando imperatore?
Pianifica la conquista del mondo conosciuto in un'enorme campagna libera a turni (che supporta modalità aggiuntive a 2 giocatori, cooperativa e competitiva). Congiure, politica, intrighi, rivolte, lealtà, onore, ambizione, tradimento. Le decisioni che prenderai plasmeranno il tuo destino.
Crea grandi eserciti e affronta il campo di battaglia grazie alla modalità di combattimento in tempo reale. Metti alla prova le tue abilità strategiche controllando decine di migliaia di uomini che si affrontano in epiche battaglie per terra e per mare.
Combatti per la gloria di Roma alla guida di una delle tre famiglie o assumi il comando di una tra le molte civiltà nemiche, ciascuna delle quali consente uno stile di gioco molto diversi con centinaia di unità esclusive; dalle macchine d'assedio alla cavalleria pesante, dai legionari ricoperti d'acciaio ai berserker barbari.
Ammira antiche città esotiche e immensi eserciti riprodotti nei minimi dettagli nel corso di battaglie mozzafiato. Le visuali dettagliate permettono di osservare i tuoi uomini mentre lanciano grida di vittoria o urlano di dolore in prima linea, mentre una nuova visuale tattica ti fornirà una veduta aerea del massacro per consentirti di prendere al meglio le decisioni strategiche.
Esperienza profondamente modificabile, con meccanica di gioco e prestazioni grafiche 
ottimizzate per adattarsi a hardware di tutti i tipi.", 2013, 'PC', 'https://www.youtube.com/watch?v=97Y8-QFJbWo',5);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (26,'Ancestors Legacy',25.39,18,'Strategia', "Assumi il comando del tuo esercito e prendi d'assalto l'Europa medievale, campagna dopo 
campagna. Una volta scelta una delle quattro nazioni disponibili (Vichinghi, Slavi, Anglosassoni e Germanici) dovrai fare ben più che conquistare, razziare e saccheggiare accampamenti nemici, villaggi e città. Per assicurarti la vittoria, utilizza l'ampia gamma di opzioni tattiche disponibili, sfrutta strategicamente l'ambiente a tuo vantaggio e gestisci al meglio le basi temporanee e gli insediamenti.
Ancestors Legacy è un gioco strategico in tempo reale di grande accuratezza storica, ispirato a eventi realmente accaduti nel Medioevo. Il gioco unisce la gestione delle risorse alla costruzione di basi su larga scala e al combattimento a turni su vasti campi di battaglia; il tutto rappresentato in grande dettaglio grazie al motore grafico Unreal Engine 4. Vivi l'esperienza delle sanguinose battaglie medievali in modo immersivo, grazie alla visuale cinematografica che ti trasporterà nel cuore dell'azione con la semplice pressione di un tasto.
4 nazioni giocabili in una lunga e articolata campagna per giocatore singolo, ispirata a reali eventi storici
Opzioni tattiche avanzate, che includono l'utilizzo dell'ambiente circostante, dell'esperienza e del morale.
La visuale cinematografica ti trasporta nel cuore della battaglia. Stupefacente fedeltà grafica grazie a Unreal Engine 4
Appassionanti battaglie multigiocatore. Gestione ottimizzata delle risorse e della costruzione dei villaggi
Controlli di gioco accurati, con supporto controller nativo", 2018, 'PC', 'https://www.youtube.com/watch?v=EW74W28advQ',20);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (27,'The Crew 2',49.98,12,'Azione', "L'iterazione più recente nel rivoluzionario franchise The Crew, THE CREW 2 
cattura lo spirito dei motori americani in uno dei mondi aperti più emozionanti mai creati. Mettete alla prova le vostre abilità in una vasta gamma di discipline con auto, moto, barche e aerei. La guida raggiunge nuove vette, letteralmente: gli interi Stati Uniti d'America sono a disposizione per competizioni, esplorazione e libertà senza limiti. Registrate ogni momento glorioso e condividetelo con il mondo: la fama vi attende!
Benvenuti a Motornation, una splendida ed enorme nazione costruita appositamente per gareggiare: avete a disposizione tutti gli Stati Uniti d'America. Esplorate liberamente terra, mare e cielo. Da costa a costa, i piloti di strada e professionisti, gli amanti dello sterrato e dello stile libero possono sfidarsi in ogni tipo di disciplina. Unitevi a loro in gare al cardiopalma e condividete i momenti gloriosi con il mondo. THE CREW 2 vi dà la possibilità di dimostrare il vostro talento e di diventare campioni delle corse di ogni tipo.
Unitevi a quattro diverse famiglie motoristiche: piloti di strada e professionisti, esperti di fuoristrada e giocatori in stile libero. Vi coinvolgeranno con nuovi veicoli e scoprirete la loro cultura e le discipline. Tramite competizioni e incontri casuali, trovate e affinate il vostro stile personale, ottenete e personalizzate i veicoli dei vostri sogni, metteteli in bella mostra nel QG e diventate famosi nella scena motoristica americana.
BENVENUTI A MOTORNATION – AFFRONTATE LA SFIDA A TERRA, IN ACQUA E NEI CIELI.
Spingetevi oltre i limiti e affrontate nuove esperienze in luoghi iconici. 
Volate e volteggiate attraverso la nebbia e le nuvole sopra le Montagne Rocciose innevate, consumate le gomme nei vicoli di New York, 
navigate lungo il Mississippi ed esplorate ogni centimetro del Grand Canyon. Macchine da sogno, alcune tra le moto americane più iconiche, 
aerei rapidi e motoscafi: le opportunità di divertimento e sfida negli Stati Uniti sono illimitate.", 2018, 'XboxOne','https://www.youtube.com/watch?v=TrxhAgpLo3M',25);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (28,'God of War',61.46,18,'Avventura', "Lasciatosi alle spalle la sua sete di vendetta verso gli dèi dell'Olimpo, Kratos ora vive 
nella terra delle divinità e dei mostri norreni.
È in questo mondo ostile e spietato che dovrà combattere per la sopravvivenza e insegnare a suo figlio non solo a fare lo stesso, ma anche a evitare di ripetere gli stessi errori fatali del Fantasma di Sparta...
Questa sorprendente rielaborazione di God of War contiene tutti gli elementi caratteristici dell'iconica serie (combattimenti brutali, scontri epici con i boss e dimensioni mozzafiato) uniti a una narrazione intensa e commovente che getta una nuova luce sul mondo di Kratos.
Una nuova intensa narrazione.Nella sua nuova veste di mentore e protettore di un figlio intenzionato a conquistare la stima del padre, Kratos ha davanti a sé l'inaspettata opportunità di imparare a gestire la rabbia che lo ha sempre caratterizzato. Interrogandosi sull'eredità oscura trasmessa al figlio, spera di poter rimediare alle mancanze e agli orrori del proprio passato.
Un mondo ancora più oscuro. Immerso in foreste, montagne e regni incontaminati tipici del folklore nordico, dovrai districarti in una nuova e pericolosa terra corredata da un pantheon di creature, mostri e dèi.
Feroci combattimenti. Con una intima visuale OTS (sopra la spalla), che porta l'azione più vicina che mai, il combattimento è in primo piano,
 frenetico e duro. La potente ascia magica di Kratos assume una doppia funzione di arma brutale e di versatile strumento per l'esplorazione. 
 Non abbassare mai la guardia.", 2018, 'PS4','https://www.youtube.com/watch?v=aO2p_y4e6_A',25);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (29,'Hunting Simulator',33.43,16,'Simulazione', "Vivi l’avventura della caccia in una splendida e realistica rappresentazione 
della natura selvaggia.
Bigben e lo sviluppatore Neopica sono orgogliosi di annunciare Hunting Simulator, la prima simulazione di caccia per console di ultima generazione.
Uno tra i più completi bestiari all’interno di un gioco di caccia, con 37 specie di animali dislocate in 12 enormi aree di caccia.
Centinaia di obiettivi in tre diverse modalità di gioco: campagna, caccia libera e pratica di tiro.
Tutto il necessario per la caccia: fucili, balestre, archi lunghi, così come esche, fischietti da caccia e indicatori di vento.
Modalità cooperativa a 4 giocatori per iniziare l’avventura con 3 partner di caccia.
Per la prima volta in un gioco di caccia sarà possibile utilizzare un drone, in modo da esplorare l’ambiente e le zone circostanti.", 2018, 'Nintendo switch', 'https://www.youtube.com/watch?v=QDoyQCF9htI',20);

insert into Gioco(SerialNumber,Nome,Prezzo,Pegi,Genere,Descrizione,Anno,Piattaforma,Video,Quantità)
values (30,'Mario Tennis Aces',49.17,3,'Sport', "Un nuovo gioco della serie Mario Tennis è in arrivo su Nintendo Switch: Mario Tennis Aces!
Sfoggiando un'elegante tenuta da tennis, Mario scende in campo per affrontare una grande varietà di personaggi in partite mozzafiato.
In questo nuovo capitolo troverai diverse innovazioni in termini di tecniche e strategie che ti terranno sempre sul chi vive.
Inoltre, per la prima volta dai tempi di Mario Tennis: Power Tour per Game Boy Advance, ci sarà anche una modalità storia, con tante missioni e un gran numero di boss.
Mario scende in campo per affrontare una grande varietà di personaggi in partite mozzafiato; il gioco include più di 15 personaggi giocabili, ognuno con le sue caratteristiche uniche!
Il gioco offre un approccio al gioco del tennis curato nei minimi dettagli e concentrato su tattica e strategia
Ci saranno anche la modalità storia, con tante missioni e un gran numero di boss, e la modalità swing, che ti permette di usare il Joy-con come una racchetta da tennis
Le varie possibilità di gioco offerte dalla console Nintendo Switch permettono a fino a quattro giocatori di entrare in campo e giocare 
contemporaneamente, quando e dove vogliono!", 2018, 'Nintendo switch', 'https://www.youtube.com/watch?v=ur2eicGGrek',20);

/*Immagini*/

/*F1 2017*/
insert into Immagine(Nome,Gioco)
values ('img/games/F1 2017/1.jpg',3);

insert into Immagine(Nome,Gioco)
values ('img/games/F1 2017/2.jpg',3);

insert into Immagine(Nome,Gioco)
values ('img/games/F1 2017/3.jpg',3);

insert into Immagine(Nome,Gioco)
values ('img/games/F1 2017/4.jpg',3);

insert into Immagine(Nome,Gioco)
values ('img/games/F1 2017/slider.jpg',3);


/*Deus ex*/
insert into Immagine(Nome,Gioco)
values ('img/games/Deus Ex/1.jpg',1);	

insert into Immagine(Nome,Gioco)
values ('img/games/Deus Ex/2.jpg',1);

insert into Immagine(Nome,Gioco)
values ('img/games/Deus Ex/3.jpg',1);

insert into Immagine(Nome,Gioco)
values ('img/games/Deus Ex/4.jpg',1);

insert into Immagine(Nome,Gioco)
values ('img/games/Deus Ex/slider.jpg',1);


/*Pes 2018*/
insert into Immagine(Nome,Gioco)
values ('img/games/PES 18/1.jpg',2);

insert into Immagine(Nome,Gioco)
values ('img/games/PES 18/2.jpg',2);

insert into Immagine(Nome,Gioco)
values ('img/games/PES 18/3.jpg',2);

insert into Immagine(Nome,Gioco)
values ('img/games/PES 18/4.jpg',2);

insert into Immagine(Nome,Gioco)
values ('img/games/PES 18/slider.jpg',2);


/*Far Cry 5*/
insert into Immagine(Nome,Gioco)
values ('img/games/Far Cry 5/1.jpg',5);

insert into Immagine(Nome,Gioco)
values ('img/games/Far Cry 5/2.jpg',5);

insert into Immagine(Nome,Gioco)
values ('img/games/Far Cry 5/3.jpg',5);

insert into Immagine(Nome,Gioco)
values ('img/games/Far Cry 5/4.jpg',5);

insert into Immagine(Nome,Gioco)
values ('img/games/Far Cry 5/slider.jpg',5);

/*moto gp 2018*/
insert into Immagine(Nome,Gioco)
values ('img/games/MotoGP 18/1.jpg',15);

insert into Immagine(Nome,Gioco)
values ('img/games/MotoGP 18/2.jpg',15);

insert into Immagine(Nome,Gioco)
values ('img/games/MotoGP 18/3.jpg',15);

insert into Immagine(Nome,Gioco)
values ('img/games/MotoGP 18/4.jpg',15);

insert into Immagine(Nome,Gioco)
values ('img/games/MotoGP 18/slider.jpg',15);

/*Assansin's Creed Origin*/
insert into Immagine(Nome,Gioco)
values ('img/games/Assassin''s Creed Origins/1.jpg',6);

insert into Immagine(Nome,Gioco)
values ('img/games/Assassin''s Creed Origins/2.jpg',6);

insert into Immagine(Nome,Gioco)
values ('img/games/Assassin''s Creed Origins/3.jpg',6);

insert into Immagine(Nome,Gioco)
values ('img/games/Assassin''s Creed Origins/4.jpg',6);

insert into Immagine(Nome,Gioco)
values ('img/games/Assassin''s Creed Origins/slider.jpg',6);



/*call of duty ww2*/
insert into Immagine(Nome,Gioco)
values ('img/games/Call Of Duty WW2/1.jpg',4);

insert into Immagine(Nome,Gioco)
values ('img/games/Call Of Duty WW2/slider.jpg',4);

insert into Immagine(Nome,Gioco)
values ('img/games/Call Of Duty WW2/2.jpg',4);

insert into Immagine(Nome,Gioco)
values ('img/games/Call Of Duty WW2/3.jpg',4);

insert into Immagine(Nome,Gioco)
values ('img/games/Call Of Duty WW2/4.jpg',4);


/* Just Dance® 2018*/
insert into Immagine(Nome,Gioco)
values ('img/games/Just Dance® 2018/1.jpg',7);

insert into Immagine(Nome,Gioco)
values ('img/games/Just Dance® 2018/2.jpg',7);

insert into Immagine(Nome,Gioco)
values ('img/games/Just Dance® 2018/3.jpg',7);

insert into Immagine(Nome,Gioco)
values ('img/games/Just Dance® 2018/4.jpg',7);

insert into Immagine(Nome,Gioco)
values ('img/games/Just Dance® 2018/slider.jpg',7);


/*Sid Meier's Civilization VI*/

insert into Immagine(Nome,Gioco)
values ('img/games/Sid Meier''s Civilization VI/1.jpg',8);

insert into Immagine(Nome,Gioco)
values ('img/games/Sid Meier''s Civilization VI/2.jpg',8);

insert into Immagine(Nome,Gioco)
values ('img/games/Sid Meier''s Civilization VI/3.jpg',8);

insert into Immagine(Nome,Gioco)
values ('img/games/Sid Meier''s Civilization VI/4.jpg',8);

insert into Immagine(Nome,Gioco)
values ('img/games/Sid Meier''s Civilization VI/slider.jpg',8);


/*Final Fantasy XV*/

insert into Immagine(Nome,Gioco)
values ('img/games/Final Fantasy XV/1.jpg',9);

insert into Immagine(Nome,Gioco)
values ('img/games/Final Fantasy XV/2.jpg',9);

insert into Immagine(Nome,Gioco)
values ('img/games/Final Fantasy XV/3.jpg',9);

insert into Immagine(Nome,Gioco)
values ('img/games/Final Fantasy XV/4.jpg',9);

insert into Immagine(Nome,Gioco)
values ('img/games/Final Fantasy XV/slider.jpg',9);


/*LEGO Gli Incredibili*/

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Gli Incredibili/1.jpg',10);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Gli Incredibili/2.jpg',10);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Gli Incredibili/3.jpg',10);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Gli Incredibili/4.jpg',10);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Gli Incredibili/slider.jpg',10);


/*Pokémon Let's Go,Pikachu!*/
insert into Immagine(Nome,Gioco)
values ('img/games/Pokémon Let''s Go,Pikachu!/1.jpg',11);

insert into Immagine(Nome,Gioco)
values ('img/games/Pokémon Let''s Go,Pikachu!/2.jpg',11);

insert into Immagine(Nome,Gioco)
values ('img/games/Pokémon Let''s Go,Pikachu!/3.jpg',11);

insert into Immagine(Nome,Gioco)
values ('img/games/Pokémon Let''s Go,Pikachu!/slider.jpg',11);


/*Injustice 2*/

insert into Immagine(Nome,Gioco)
values ('img/games/Injustice 2/1.jpg',12);

insert into Immagine(Nome,Gioco)
values ('img/games/Injustice 2/2.jpg',12);

insert into Immagine(Nome,Gioco)
values ('img/games/Injustice 2/3.jpg',12);

insert into Immagine(Nome,Gioco)
values ('img/games/Injustice 2/4.jpg',12);

insert into Immagine(Nome,Gioco)
values ('img/games/Injustice 2/slider.jpg',12);


/*MXGP Pro*/

insert into Immagine(Nome,Gioco)
values ('img/games/MXGP Pro/1.jpg',13);

insert into Immagine(Nome,Gioco)
values ('img/games/MXGP Pro/2.jpg',13);

insert into Immagine(Nome,Gioco)
values ('img/games/MXGP Pro/3.jpg',13);

insert into Immagine(Nome,Gioco)
values ('img/games/MXGP Pro/slider.jpg',13);


/*Watch Dogs 2 */

insert into Immagine(Nome,Gioco)
values ('img/games/Watch Dogs 2/1.jpg',14);

insert into Immagine(Nome,Gioco)
values ('img/games/Watch Dogs 2/2.jpg',14);

insert into Immagine(Nome,Gioco)
values ('img/games/Watch Dogs 2/3.jpg',14);

insert into Immagine(Nome,Gioco)
values ('img/games/Watch Dogs 2/4.jpg',14);

insert into Immagine(Nome,Gioco)
values ('img/games/Watch Dogs 2/slider.jpg',14);


/* Creazione giochi 16-30 */

/*Tekken 7*/
insert into Immagine(Nome,Gioco)
values ('img/games/Tekken 7/1.jpg',16);

insert into Immagine(Nome,Gioco)
values ('img/games/Tekken 7/2.jpg',16);

insert into Immagine(Nome,Gioco)
values ('img/games/Tekken 7/3.jpg',16);

insert into Immagine(Nome,Gioco)
values ('img/games/Tekken 7/4.jpg',16);

insert into Immagine(Nome,Gioco)
values ('img/games/Tekken 7/slider.jpg',16);

/* Lords of the Fallen */

insert into Immagine(Nome,Gioco)
values ('img/games/Lords of the Fallen/1.jpg',17);

insert into Immagine(Nome,Gioco)
values ('img/games/Lords of the Fallen/2.jpg',17);

insert into Immagine(Nome,Gioco)
values ('img/games/Lords of the Fallen/3.jpg',17);

insert into Immagine(Nome,Gioco)
values ('img/games/Lords of the Fallen/4.jpg',17);

insert into Immagine(Nome,Gioco)
values ('img/games/Lords of the Fallen/slider.jpg',17);

/* Fallout 4*/

insert into Immagine(Nome,Gioco)
values ('img/games/Fallout 4/1.jpg',18);

insert into Immagine(Nome,Gioco)
values ('img/games/Fallout 4/2.jpg',18);

insert into Immagine(Nome,Gioco)
values ('img/games/Fallout 4/3.jpg',18);

insert into Immagine(Nome,Gioco)
values ('img/games/Fallout 4/4.jpg',18);

insert into Immagine(Nome,Gioco)
values ('img/games/Fallout 4/slider.jpg',18);

/* WWE 2K16 */

insert into Immagine(Nome,Gioco)
values ('img/games/WWE 2K16/1.jpg',19);

insert into Immagine(Nome,Gioco)
values ('img/games/WWE 2K16/2.jpg',19);

insert into Immagine(Nome,Gioco)
values ('img/games/WWE 2K16/3.jpg',19);

insert into Immagine(Nome,Gioco)
values ('img/games/WWE 2K16/4.jpg',19);

insert into Immagine(Nome,Gioco)
values ('img/games/WWE 2K16/slider.jpg',19);

/* LEGO Marvel Avengers */

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Marvel Avengers/1.jpg',20);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Marvel Avengers/2.jpg',20);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Marvel Avengers/3.jpg',20);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Marvel Avengers/4.jpg',20);

insert into Immagine(Nome,Gioco)
values ('img/games/LEGO Marvel Avengers/slider.jpg',20);

/* Dragon Ball Xenoverse*/ 

insert into Immagine(Nome,Gioco)
values ('img/games/Dragon Ball Xenoverse/1.jpg',21);

insert into Immagine(Nome,Gioco)
values ('img/games/Dragon Ball Xenoverse/2.jpg',21);

insert into Immagine(Nome,Gioco)
values ('img/games/Dragon Ball Xenoverse/3.jpg',21);

insert into Immagine(Nome,Gioco)
values ('img/games/Dragon Ball Xenoverse/4.jpg',21);

insert into Immagine(Nome,Gioco)
values ('img/games/Dragon Ball Xenoverse/slider.jpg',21);

/* The Last of Us*/

insert into Immagine(Nome,Gioco)
values ('img/games/The Last of Us/1.jpg',22);

insert into Immagine(Nome,Gioco)
values ('img/games/The Last of Us/2.jpg',22);

insert into Immagine(Nome,Gioco)
values ('img/games/The Last of Us/3.jpg',22);

insert into Immagine(Nome,Gioco)
values ('img/games/The Last of Us/4.jpg',22);

insert into Immagine(Nome,Gioco)
values ('img/games/The Last of Us/slider.jpg',22);

/* GTA V*/

insert into Immagine(Nome,Gioco)
values ('img/games/GTA V/1.jpg',23);

insert into Immagine(Nome,Gioco)
values ('img/games/GTA V/2.jpg',23);

insert into Immagine(Nome,Gioco)
values ('img/games/GTA V/3.jpg',23);

insert into Immagine(Nome,Gioco)
values ('img/games/GTA V/4.jpg',23);

insert into Immagine(Nome,Gioco)
values ('img/games/GTA V/slider.jpg',23);

/* The Sims 4 Stagioni*/

insert into Immagine(Nome,Gioco)
values ('img/games/The Sims 4 Stagioni/1.jpg',24);

insert into Immagine(Nome,Gioco)
values ('img/games/The Sims 4 Stagioni/2.jpg',24);

insert into Immagine(Nome,Gioco)
values ('img/games/The Sims 4 Stagioni/3.jpg',24);

insert into Immagine(Nome,Gioco)
values ('img/games/The Sims 4 Stagioni/4.jpg',24);

insert into Immagine(Nome,Gioco)
values ('img/games/The Sims 4 Stagioni/slider.jpg',24);

/* Total War ROME II*/

insert into Immagine(Nome,Gioco)
values ('img/games/Total War ROME II/1.jpg',25);

insert into Immagine(Nome,Gioco)
values ('img/games/Total War ROME II/2.jpg',25);

insert into Immagine(Nome,Gioco)
values ('img/games/Total War ROME II/3.jpg',25);

insert into Immagine(Nome,Gioco)
values ('img/games/Total War ROME II/4.jpg',25);

insert into Immagine(Nome,Gioco)
values ('img/games/Total War ROME II/slider.jpg',25);

/* Ancestors Legacy*/

insert into Immagine(Nome,Gioco)
values ('img/games/Ancestors Legacy/1.jpg',26);

insert into Immagine(Nome,Gioco)
values ('img/games/Ancestors Legacy/2.jpg',26);

insert into Immagine(Nome,Gioco)
values ('img/games/Ancestors Legacy/3.jpg',26);

insert into Immagine(Nome,Gioco)
values ('img/games/Ancestors Legacy/4.jpg',26);

insert into Immagine(Nome,Gioco)
values ('img/games/Ancestors Legacy/slider.jpg',26);

/* The Crew 2 */

insert into Immagine(Nome,Gioco)
values ('img/games/The Crew 2/1.jpg',27);

insert into Immagine(Nome,Gioco)
values ('img/games/The Crew 2/2.jpg',27);

insert into Immagine(Nome,Gioco)
values ('img/games/The Crew 2/3.jpg',27);

insert into Immagine(Nome,Gioco)
values ('img/games/The Crew 2/4.jpg',27);

insert into Immagine(Nome,Gioco)
values ('img/games/The Crew 2/slider.jpg',27);

/* God of War*/

insert into Immagine(Nome,Gioco)
values ('img/games/God of War/1.jpg',28);

insert into Immagine(Nome,Gioco)
values ('img/games/God of War/2.jpg',28);

insert into Immagine(Nome,Gioco)
values ('img/games/God of War/3.jpg',28);

insert into Immagine(Nome,Gioco)
values ('img/games/God of War/4.jpg',28);

insert into Immagine(Nome,Gioco)
values ('img/games/God of War/slider.jpg',28);

/* Hunting Simulator*/

insert into Immagine(Nome,Gioco)
values ('img/games/Hunting Simulator/1.jpg',29);

insert into Immagine(Nome,Gioco)
values ('img/games/Hunting Simulator/2.jpg',29);

insert into Immagine(Nome,Gioco)
values ('img/games/Hunting Simulator/3.jpg',29);

insert into Immagine(Nome,Gioco)
values ('img/games/Hunting Simulator/4.jpg',29);

insert into Immagine(Nome,Gioco)
values ('img/games/Hunting Simulator/slider.jpg',29);

/* Mario Tennis Aces*/

insert into Immagine(Nome,Gioco)
values ('img/games/Mario Tennis Aces/1.jpg',30);

insert into Immagine(Nome,Gioco)
values ('img/games/Mario Tennis Aces/2.jpg',30);

insert into Immagine(Nome,Gioco)
values ('img/games/Mario Tennis Aces/3.jpg',30);

insert into Immagine(Nome,Gioco)
values ('img/games/Mario Tennis Aces/4.jpg',30);

insert into Immagine(Nome,Gioco)
values ('img/games/Mario Tennis Aces/slider.jpg',30);


/* Fine inserimento immagini giochi */

/* Inserimento istruzioni che eliminano un utente dopo 24 ore se non ha confermato la registrazione */
SET GLOBAL event_scheduler = ON;

CREATE EVENT cancellaUtenti24ore
    ON SCHEDULE
      EVERY 1 DAY
        DO
delete from utente
WHERE   utente.DataInvioMail < DATE_SUB(NOW(), INTERVAL 1 DAY)
and     utente.Verificato = false
