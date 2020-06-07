//////////// UX1

This prototype relates to the proposed project plan outlined in the PROJ1 documentation. The implementation of the initial wireframe including graphical elements, use case diagrams, and technologies and third parties have all been adhered to in UX1.
The use of bootstrap has successfully achieved the aforementioned results by taking advantage of default components, thus eliminating the need for writing code from scratch.
Proceeding forward with UX1, I believe the technologies and third parties currently used are capable of achieving the desired results outlined within UX2.
'Bootstrap' and 'Font Awesome' are both released under the MIT license, and do not enforce any additional licensing attributions. Furthermore, as they are open source there is no cost associated with their implentation.

//////////// PROJ2

web service testing has been tested via the following software:

WAMP 64-bit 3.2.0
phpMyAdmin v5.0.2
Postman v7.21.1
Visual Studio Code v1.43
GitBash v2.26.0

Download GitBash or use your preffered CLI.
Go to https://github.com/la-x/PROJ2 (now https://github.com/la-x/wirelogu) and copy the link to clone with HTTPS: https://github.com/la-x/PROJ2.git (now https://github.com/la-x/wirelogu)
Open CLI and cd into desired location.
Clone the above repository by running the following command:
git clone https://github.com/la-x/PROJ2.git (now https://github.com/la-x/wirelogu)
Download and install LAMP, XAMP or WAMP.
Install phpmyadmin and ensure username is set to 'root' and password is set to ''.
Create a new database called 'app' and import the sql file called 'app.sql'.
Locate the folder "testscripts" and run shell scripts to test functionality.
Download postman and alter URL's of any desired test scripts.
note: URL's can be obtained via opening shell scripts with your preffered document writer or text editor (notepad, vscode etc.).

TESTING

locate files in ./testscripts and run desired test function.
confirm via phpMyAdmin that the appropriate function has been both creating and reading to the database.
In addition, locate the user_log table within phpMyAdmin and confirm that GET's and POST's have been logged.

//////////// UX2

Go to https://github.com/la-x/wirelogu and copy the link to clone with HTTPS: https://github.com/la-x/wirelogu.git
Place folder into WAMP/XAMP/LAMP or your preferred server directory.
Open phpMyAdmin and create a new database titled 'wirelogdb', whilst ensuring phpMyAdmin user credentials are set to username 'root' and password ''.
Find the SQL file titled 'wl.sql' located inside the root directory, and import the file into the 'wirelogdb' database.
Ensure front end forms are posting to database, as well as all forms are providing user feedback for validation.
Ensure 'Jobs' search function retrieves data from database. In addition, ensure devtools 'Network' is set to 'Slow 3G' and loading spinner is visable whilst data is being retrieved, and disapears upon retrieval.
Ensure data entered into forms is posted/retrieved via database, with the inclusion of both status 200 and fetch visable within the Network tab of devtools. 
See screenshots of AJAX fetch requests to APA inclusive of loader/spinner.
See screenshots for localStorage items and performance tab.
Save icon to Desktop/Home screen to ensure manifest file has been correctly implemented.