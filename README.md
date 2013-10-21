Specificatie aplicatie Timesheet Management v1.0

    Se doreste implementarea unei aplicatii interne de tip timesheet (pontaj) 
pt. Compania XYZ care e organizata astfel:

- divizia IT
    - Departament consultanta (DC)
    - Departament dezvoltare software (DDS)
    - Departament service (DS)
    - Departament asamblare calculatoare (DA)

- divizia MHF
    - Departament Marketing (DM)
    - Departament Resurse umane (DHR)
    - Departament Financiar (DFI)

    Fiecare angajat are asignat la angajare un ID intern unic (de ex. XYZDS124).

    Aplicatia va fi una web based si va oferi posibilitatea autentificarii 
securizate a urmatoarelor tipuri de utlizatori:
- angajat 
- sef de departament
- sef de divizie
- director
- administrator aplicatie

    Angajatul are posibilitatea de a lucra la completarea timesheet-ului lunar, 
ceea ce presupune ca in fiecare zi lucratoare sa completeze fisa zilnica prin 
introducerea activitatilor depuse, pt. cele 8 ore de lucru. De ex. pentru o zi 
de lucru un angajat poate introduce in aplicatie urmatoarele date:

- 4 ore lucru la proiectul “portal” pentru clientul “Ministerul Agriculturii”
- 1 ora sedinta
- 1 ora training Java
- 2 ore deplasare la clientul “Ministerului Agriculturii”

    Un timesheet lunar poate fi vazut ca o colectie de fise zilnice pentru o 
anumita luna (de ex. timesheet lunar pe luna Octombrie).

    Aplicatia trebuie sa permita si introducerea de ore suplimentare, caz in 
care acestea vor fi tratate diferit de cele 8 ore, ele avind o eticheta 
distinctiva (EXTRA).

    La finalul unei luni calendaristice timesheetul lunar nu mai poate fi editat
iar seful de departament il poate aproba sau rejecta. In cazul in care il 
rejecteaza trebuie sa introduca motivul rejectarii, apoi angajatul primeste un 
email prin care este anuntat ca timesheetul sau a fost rejectat impreuna cu 
motivul. Angajatul poate apoi sa editeze timesheet-ul facind modificarile 
necesare si sa retrimita timesheet-ul spre aprobare sefului de departament, 
dupa care procesul se reia, seful de departament putind aproba sau rejecta 
timesheet-ul. Un timesheet lunar poate trece astfel prin urmatoarele stari: 
OPEN, SUBMITTED, APPROVED sau REJECTED.

    Odata creat, timesheetul este OPEN si editabil.

    In momentul in care angajatul trimite timesheet-ul lunar sefului de 
departament, seful de departament primeste o notificare prin email. Timesheet-ul
devine SUBMITTED si nu mai este editabil. Un timesheet APPROVED (aprobat de 
seful de departament) e considerat inchis, deci non-editabil.

    O data ce timesheet-ul este REJECTED angajatul il poate trimite in starea 
OPEN a.i sa-l modifice.

    Daca la sfarsitul unei luni calendaristice angajatul nu a trimis 
timesheet-ul lunar sefului de departament (deci nu are statusul SUBMITTED) 
angajatul primeste o notificare prin email care sa-i reaminteasca ca trebuie 
facut Submit. Angajatii sef de departament si peste acest nivel nu trebuie sa 
trimita timesheet-ul lor lunar superiorului spre aprobare (odata completat si 
salvat este considerat automat aprobat)

    Angajatul poate crea o fisa zilnica de la 0 sau poate duplica o fisa zilnica
deja salvata.

    Seful de departament introduce proiectele si clientii la care lucreaza 
angajatii sai (ex. de clienti „Vodafone Romania”, „Apa Nova”, etc; exemple de 
proiecte „portal web”, „aplicatie CRM”, „infrastructura retea”, etc). Tipul de 
activitati uzuale in companie sunt: lucru din sediu, deplasare la client, 
sedinte, cursuri. Tipurile de inactivitate sunt vacanta, boala, sarbatori 
legale. Seful de departament adauga/sterge angajatii din departamentul propriu.

    Administratorul aplicatiei poate configura aplicatia specificind ce divizii 
exista in companie si ce departamente exista in cadrul fiecarei divizii. 
Aplicatia trebuie sa permita pe viitor suprimarea de departamente/divizii sau 
adaugarea de noi departamente/divizii in functie de reorganizarea pe viitor a 
firmei. Administratorul asigneaza persoanele care sunt sefi de departament/sefi
de divizie/director. Deasemenea el poate activa mecanismul de Audit prin care
toate actiunile desfasurate in aplicatie sunt logate intr-un fisier (de ex. 
daca un angajat a editat o fisa zilnica modificind perioada petrecuta intre 
orele 14-16 din “training Java” in “sedinta” acest lucru se scrie in fisierul 
de log). Se vor defini nivele de logare, de ex. sa se poata selecta ce 
informatie se logheaza functie de rolul user-ului (se doreste sa se logheze 
numai ce interactiuni au facut sefii de departament).

    Functie de rolul avut, un user poate vedea urmatoarele drepturi referitor la
timesheet-uri:

USER                DREPTURI

Angajat             Creaza, Citeste, modifica propriul timesheet.

Sef de dept.        Creaza, Citeste, modifica propriul timesheet;
                    Citeste, aproba/rejecteaza timesheet-uri pt. angajatii din 
                    dept. pe care il conduce

Sef de divizie      Creaza, Citeste, modifica propriul timesheet;
                    Citeste orice timesheet pt. orice angajat din divizie.
                    
Director            Creaza,Citeste, modifica propriul timesheet;
                    Citeste orice timesheet pt. orice angajat din firma.
                    
    In plus angajatii de pe nivelul sef de departament si mai sus pot vedea 
Rapoarte dupa cum urmeaza:

- sef de departament:

a) introduce ID-ul intern unic per angajat si intervalul (data_start; 
data_sfarsit) si se vizualizeaza un sumar prezentind nr. total de ore lucrat de 
angajat per fiecare proiect in parte. Deasemenea se arata % din totalul de ore 
care a fost alocat fiecarei activitati (a.i sa se vada gradul de utilizare al 
angajatului)

b) introduce numele proiectului (permitindu-se si expresii regulate) si perioada
(data_start;data_sfarsit) si vizualizeaza ce persoane au lucrat la proiect si 
cate ore (pt. fiecare persoana in parte)

c) introduce perioada (data_start;data_sfarsit) si vizualizeaza nr. total de ore
lucrate (cumulat de la toti angajatii care au lucrat la proiect) pentru fiecare 
proiect in parte. Va exista o optiune de a sorta ascendent/descendent 
rezultatele raportului functie de nr. total de ore lucrate.

- sef de divizie:

d) introduce perioada (data_start; data_sfarsit) si se afiseaza pentru fiecare 
departament din divizia condusa proiectele in lucru si nr. total de ore lucrate 
pentru acel proiect.

e) introduce numele departamentului si afiseaza toti angajatii din departament

- director:

Are acces la rapoartele d) si e) plus

f) introduce perioada (data_start;data_sfarsit) si se afiseaza toti clientii 
firmei pentru care s-a lucrat in acea perioada; pentru fiecare client se 
afiseaza proiectele, ce numar de ore si ce % din timpul total de lucru al 
lucratorilor a fost dedicat pt. acel proiect.

    
    Toate rapoartele vor fi prezentate vizual cat mai atractiv si intuitiv (de 
ex. sub forma de bar-chart, pie-chart, grafice, etc generate dinamic). 
Obligatoriu se va genera si o versiune pdf a raportului care va fi disponibila 
pt. download a.i sa poata fi printata/trimisa prin email.

    Cerintele prezentate pana in acest punct sunt obligatorii. Urmatoarea 
cerinta este la alegere, varianta A) sau B)

A) Integrare cu aplicatia financiara prin web services

    Firma xyz dispune de o aplicatie financiara mai veche care este inca in uz 
in companie si pe baza careia se calculeaza salariile lunare. Aceasta aplicatie
se va conecta la aplicatia de timesheet management prin servicii web pentru a 
obtine datele de care are nevoie. Trebuie implementate urmatoarele servicii web:

1) Input: id angajat, interval de timp; output: nr. de ore obisnuite lucrate, 
numarul de ore extra lucrate

2) Input: id_angajat, interval de timp; output: nr. de ore concediu odihna 
efectuate, nr. de ore concediu medical efectuate.

B) Integrare cu aplicatia de HR prin fisere xls (Excel).

1) Export timesheet lunar per angajat in format Excel

2) Rapoartele c) si d) in format Excel
