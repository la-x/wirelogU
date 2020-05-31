var home = document.getElementById('home');
var jobs = document.getElementById('jobs');
var settings = document.getElementById('settings');
var login = document.getElementById('login');
var techs = document.getElementById('techs');

function hideNav() {
    document.getElementById('navbarSupportedContent').classList.remove("show");
}

function showHome() {
    home.removeAttribute('hidden', 'hidden');
    jobs.setAttribute('hidden', 'hidden');
    settings.setAttribute('hidden', 'hidden');
    login.setAttribute('hidden', 'hidden');
    techs.setAttribute('hidden', 'hidden');
    hideNav();    
}

function showJobs() {
    home.setAttribute('hidden', 'hidden');
    jobs.removeAttribute('hidden', 'hidden');
    settings.setAttribute('hidden', 'hidden');
    login.setAttribute('hidden', 'hidden');
    techs.setAttribute('hidden', 'hidden');
    hideNav();   
}

function showSettings() {
    home.setAttribute('hidden', 'hidden');
    jobs.setAttribute('hidden', 'hidden');
    settings.removeAttribute('hidden', 'hidden');
    login.setAttribute('hidden', 'hidden');
    techs.setAttribute('hidden', 'hidden');
    hideNav();   
}

function showLogin() {
    home.setAttribute('hidden', 'hidden');
    jobs.setAttribute('hidden', 'hidden');
    settings.setAttribute('hidden', 'hidden');
    login.removeAttribute('hidden', 'hidden');
    techs.setAttribute('hidden', 'hidden');
    hideNav();   
}

function showTechnicians() {
    home.setAttribute('hidden', 'hidden');
    jobs.setAttribute('hidden', 'hidden');
    settings.setAttribute('hidden', 'hidden');
    login.setAttribute('hidden', 'hidden');
    techs.removeAttribute('hidden', 'hidden');
    hideNav();   
}

function collapseShow() {
    if (document.getElementById("readMore").classList.contains("show")) {
        document.getElementById('showMe').setAttribute('hidden', 'hidden');
    } else {
        document.getElementById('showMe').removeAttribute('hidden', 'hidden');
    }
}

//-------------------------------- SEARCH JOBS--------------------------------

const searchJ = document.getElementById('searchJobs');
const matchListJ = document.getElementById('matchList');

// search jobs.json and filter it
const searchJobs = async searchText => {

    document.getElementById('loaderSearchJobs').removeAttribute("hidden", "hidden");
    // const res = await fetch('http://localhost/proj2/frontendtesting/get_job.php');
    const res = await fetch('http://localhost/wirelogU/php/ws.php?REQ_GET=readjob');
    const jobs = await res.json();
    document.getElementById('loaderSearchJobs').setAttribute("hidden", "hidden");

    // console.log(jobs);

    // get matches to current text input
    let matches = jobs.filter(job => {
        const regex = new RegExp(`^${searchText}`, 'gi');
        return job.contractor.match(regex) || job.jobID.match(regex) || job.location.match(regex);
    });

    // if input is backspaces, results return to all, below will avoid

    if (searchText.length === 0) { // if search length = 0
        matches = []; // empty array (clear out)
        matchListJ.innerHTML = ''; // clears HTML after backspacing
    }

    // console.log(matches);

    // function to output into HTML (pass in matches)
    outputHtmlJobs(matches);
};

// show results in HTML FOR SEARCHED RESULT JOBS
const outputHtmlJobs = matches => {
    if (matches.length > 0) { // check for matches
        const html = matches.map(match => `
        <div class="card card-body mb-1 text-center">
            <h4>
                <i class="fas fa-wrench"></i>
                <div class ="text-warning">${match.jobID}</div>
                <div>${match.contractor}<div>
                <div class="text-primary">${match.location}</div>
                <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#viewJobInfo" onclick="getThisJob(${match.jobID})">VIEW</button>
            </h4>
        </div>
        `).join(''); // map returns an array from an array
                    // join converts

        console.log(html);
        matchListJ.innerHTML = html;
    }
}

searchJ.addEventListener('input', () => searchJobs(searchJ.value));


//-------------------------------- VIEW ALL JOBS --------------------------------
document.getElementById('showAllJobs').addEventListener('click', showAllJobs);

function showAllJobs() {
  document.getElementById('loaderViewJobs').removeAttribute("hidden", "hidden");
  fetch('http://localhost/wirelogU/php/ws.php?REQ_GET=readjob')
  .then((res) => res.json())
  .then((data) => {
      let output = '<h1 class="display-4 text-center">ALL JOBS</h1>'; // let variable 'output'
      // console.log(data);
      data.forEach(function(job) {
          output += `
          <div class="card card-body mb-1 text-center">
            <h4>
              <i class="fas fa-wrench"></i>
              <div class ="text-warning">${job.jobID}</div>
              <div>${job.contractor}<div>
              <div class="text-primary">${job.location}</div>
              <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#viewJobInfo" onclick="getThisJob(${job.jobID})">VIEW</button>
            </h4>
          </div>
          `;
        // onclick inside forEach? onclick="getThisJob(job.jobID)"
      });
      document.getElementById('outputAllJobs').innerHTML = output;
      document.getElementById('loaderViewJobs').setAttribute("hidden", "hidden");
  })
}

//////////////////////////////////////////////////// GET COMMENTS FOR SPECIFIC JOBID

// function getThisJob(jobID) {
//   // console.log('hello');
//   //http://localhost/wirelog/php/ws.php?REQ_GET=readjoblogid&job_logID=4
//   // let job = await fetch('http://localhost/wirelog/php/ws.php?REQ_GET=readjoblogid&job_logID=' + jobID).json();
//   // document.getElementById("modal-job-comment").innerText = job.comment;
//   var res = fetch('http://localhost/wirelog/php/ws.php?REQ_GET=getjobcomment&jobID=' + jobID).json();
//   // var comments = res.json();
//   document.getElementById("commentOutput").innerText = res;
// }

// async function getThisJob(jobID) {
//   const url = ('http://localhost/wirelog/php/ws.php?REQ_GET=readjoblogid&job_logID=' + jobID);
//   const res = await fetch(url);
//   const results = await res.json();
//   // console.log(results);
//   document.getElementById('commentOutput').innerText = results;
// }

// function getThisJob(jobID) {
//   fetch('http://localhost/wirelogtest/php/ws.php?REQ_GET=getjobcomment&jobID=' + jobID)
//   .then((res) => res.json())
//   .then((data) => {
//       // let output = '<h1 class="display-4 text-center">HELLO</h1>'; // let variable 'output'
//       // console.log(data);
//       var strComments = JSON.stringify(data);
//       // data.forEach(function(job_log) {
//           // strData += `
//           // <div class="card card-body mb-1 text-center">
//           //   <h4>
//           //     <div>${job_log.comment}<div>
//           //     <div>${job_log.timestamp}<div>
//           //     <div>${job_log.jobID}<div>
//           //   </h4>
//           // </div>
//           // `;
//       // });
//       // document.getElementById('commentOutput').innerText = strComments;

//       var myJSON = strComments;
//       var myObj = JSON.parse(myJSON);

//       document.getElementById('jobidOutput').innerText = myObj.jobID;
//       document.getElementById('commentOutput').innerText = myObj.comment;
//       document.getElementById('timestampOutput').innerText = myObj.timestamp;
//       // document.getElementById('techIDOutput').innerText = myObj.technicianID;
//       document.getElementById('techNameOutput').innerText = myObj.name + ' ' + myObj.surname;
//       document.getElementById('techPhoneOutput').innerText = myObj.phone;
//       // document.getElementById('techEmailOutput').innerText = myObj.email;
//       document.getElementById('techPositionOutput').innerText = myObj.position;
//   })
// }

function getThisJob(jobID) {
  fetch('http://localhost/wirelogU/php/ws.php?REQ_GET=getjobcomment&jobID=' + jobID) // test http://localhost/PROJ2/frontendtesting/get_job.php
  .then((res) => res.json())
  .then((data) => {
      let output = '<div>History<div>'; // let variable 'output'
      // console.log(data);
      data.forEach(function(job_log) {
          output += `
          <div class="card card-body mb-1 text-center">
            <div><i class="fas fa-edit text-success"></i> ${job_log.comment}</div>
            <div><i class="fas fa-calendar-day text-primary"></i> ${job_log.c_at}</div>
            <div><i class="fas fa-user text-info"></i> ${job_log.name} ${job_log.surname} <span class="text-warning">${job_log.position}</span></div>
            <div><i class="fas fa-phone-alt text-info"></i> ${job_log.phone}</div>
          </div>
          `;
      });
      document.getElementById('outputComments').innerHTML = output;
      document.getElementById('jobID').value = jobID;
  })
}

//-------------------------------- SEARCH TECHS--------------------------------

const searchT = document.getElementById('searchTechs');
const matchListT = document.getElementById('matchListTechs');

// search jobs.json and filter it
const searchTechs = async searchText => {
    const url = ('http://localhost/wirelogU/php/ws.php?REQ_GET=readtechnician');
    document.getElementById('loaderSearchTechs').removeAttribute("hidden", "hidden");
    // const res = await fetch('http://localhost/proj2/frontendtesting/get_job.php');
    const res = await fetch(url);
    const techs = await res.json();
    document.getElementById('loaderSearchTechs').setAttribute("hidden", "hidden");

    // console.log(jobs);

    // get matches to current text input
    let matches = techs.filter(technician => {
        const regex = new RegExp(`^${searchText}`, 'gi');
        return technician.name.match(regex) || technician.technicianID.match(regex) || technician.surname.match(regex);
    });

    // if input is backspaces, results return to all, below will avoid

    if (searchText.length === 0) { // if search length = 0
        matches = []; // empty array (clear out)
        matchListT.innerHTML = ''; // clears HTML after backspacing
    }

    // console.log(matches);

    // function to output into HTML (pass in matches)
    outputHtmlTechs(matches);
};

// show results in HTML FOR SEARCHED RESULT TECHS
const outputHtmlTechs = matches => {
    if (matches.length > 0) { // check for matches
        const html = matches.map(match => `
        <div class="card card-body mb-1 text-center">
            <h4>
              <i class="fas fa-user"></i>
                <div class ="text-warning">${match.technicianID}</div>
                <div>${match.name}</div>
                <div>${match.surname}</div>
                <h6><div class="text-primary">${match.email}</div></h6>
                <h5><div class="text-primary">${match.phone}</div></h5>
                <h6><div class ="text-info">${match.position}</div></h6>
            </h4>
        </div>
        `).join(''); // map returns an array from an array
                    // join converts

        console.log(html);
        matchListT.innerHTML = html;
    }
}

searchT.addEventListener('input', () => searchTechs(searchT.value));

//-------------------------------- VIEW TECHS --------------------------------
document.getElementById('showTechs').addEventListener('click', showTechs);

function showTechs() {
  const url = ('http://localhost/wirelogU/php/ws.php?REQ_GET=readtechnician');
  document.getElementById('loaderShowTechs').removeAttribute("hidden", "hidden");
  fetch(url)
  .then((res) => res.json())
  .then((data) => {
      let output = '<h1 class="display-4 text-center">ALL TECHS</h1>'; // let variable 'output'
      // console.log(data);
      data.forEach(function(technician) {
          output += `
          <div class="card card-body mb-1 text-center">
          <h4>
            <i class="fas fa-user"></i>
              <div class ="text-warning">${technician.technicianID}</div>
              <div>${technician.name}<div>
              <div>${technician.surname}<div>
              <h6><div class="text-primary">${technician.email}</div></h6>
              <h5><div class="text-primary">${technician.phone}</div></h5>
              <h6><div class ="text-info">${technician.position}</div></h6>
            </h4>
          </div>
          `;
      });
      document.getElementById('outputShowTechs').innerHTML = output;
      document.getElementById('loaderShowTechs').setAttribute("hidden", "hidden");
  })
}

//-------------------------------- VIEW USER LOG --------------------------------
document.getElementById('showUserLog').addEventListener('click', showUserLog);

function showUserLog() {
  document.getElementById('loaderUserLog').removeAttribute("hidden", "hidden");
  fetch('http://localhost/wirelogU/php/ws.php?REQ_GET=readuserlog')
  .then((res) => res.json())
  .then((data) => {
      let output = '<h1 class="display-4 text-center">ALL LOGS</h1>'; // let variable 'output'
      // console.log(data);
      data.forEach(function(user_log) {
          output += `
          <div class="card card-body mb-1 text-center">
            <h4>
            <i class="fas fa-edit"></i>
              <div class ="text-warning">${user_log.ulID}</div>
              <div>${user_log.IP}<div>
              <h6><div class="text-primary small">${user_log.browser}</div></h6>
              <h5><div>${user_log.timestamp}<div></h5>
              <h6><div class="text-info">${user_log.userMethod}<div></h6>
            </h4>
          </div>
          `;
      });
      document.getElementById('outputUserLog').innerHTML = output;
      document.getElementById('loaderUserLog').setAttribute("hidden", "hidden");
  })
}

//======================================================================= DARK MODE

const darkSwitch = document.getElementById('darkSwitch');
window.addEventListener('load', () => {
  if (darkSwitch) {
    initTheme();
    darkSwitch.addEventListener('change', () => {
      resetTheme();
    });
  }
});


function initTheme() {
  const darkThemeSelected =
    localStorage.getItem('darkSwitch') !== null &&
    localStorage.getItem('darkSwitch') === 'dark';
  darkSwitch.checked = darkThemeSelected;
  darkThemeSelected ? document.body.setAttribute('data-theme', 'dark') :
    document.body.removeAttribute('data-theme');
}


function resetTheme() {
  if (darkSwitch.checked) {
    document.body.setAttribute('data-theme', 'dark');
    localStorage.setItem('darkSwitch', 'dark');
  } else {
    document.body.removeAttribute('data-theme');
    localStorage.removeItem('darkSwitch');
  }
}

//======================================================================= FONT SIZE

const textSize = document.getElementById('textSize');
window.addEventListener('load', () => {
  if (textSize) {
    initTheme2();
    textSize.addEventListener('change', () => {
      resetTheme2();
    });
  }
});


function initTheme2() {
  const textSizeSelected =
    localStorage.getItem('textSize') !== null &&
    localStorage.getItem('textSize') === 'text';
    textSize.checked = textSizeSelected;
  textSizeSelected ? document.body.setAttribute('data-theme2', 'text') :
    document.body.removeAttribute('data-theme2');
}


function resetTheme2() {
  if (textSize.checked) {
    document.body.setAttribute('data-theme2', 'text');
    localStorage.setItem('textSize', 'text');
  } else {
    document.body.removeAttribute('data-theme2');
    localStorage.removeItem('textSize');
  }
}

//======================================================================= BURGERLESS

const noBurger = document.getElementById('noBurger');
window.addEventListener('load', () => {
  if (noBurger) {
    initTheme3();
    noBurger.addEventListener('change', () => {
      resetTheme3();
    });
  }
});


function initTheme3() {
  const noBurgerSelected =
    localStorage.getItem('noBurger') !== null &&
    localStorage.getItem('noBurger') === 'burger';
    noBurger.checked = noBurgerSelected;
    noBurgerSelected ? document.body.setAttribute('data-theme3', 'burger') :
    document.body.removeAttribute('data-theme3');
}


function resetTheme3() {
  if (noBurger.checked) {
    document.body.setAttribute('data-theme3', 'burger');
    localStorage.setItem('noBurger', 'burger');
  } else {
    document.body.removeAttribute('data-theme3');
    localStorage.removeItem('noBurger');
  }
}

//======================================================================= POST

// function submitJob(evt) {

//   // var fd = new FormData();
//   // fd.append('jobID', evt.form[0].value);
//   // fd.append('contractor', evt.form[0].value);
//   // fd.append('location', evt.form[1].value);
//   document.getElementById('loadAddJob').removeAttribute("hidden", "hidden");
//     fetch('php/ws.php?REQ_GET=createjob', {
//       method: 'POST',
//       body: JSON.stringify({
//         contractor: evt.form[0].value,
//         location: evt.form[1].value
//       }),
//       credentials: 'include'
//   });
// }

//============ JOB

preFetchJ();
// document.getElementById('addJobForm').addEventListener('submit', 
//         function(e) { appendItem(e) });
function preFetchJ() { // axios is like fetch
  // document.getElementById('loaderAddJob').removeAttribute('hidden', 'hidden');
    fetch('php/ws.php?REQ_GET=readjob', {
        method: 'GET',
        credentials: 'include'
    })
    .then((response) => response.json())
    .then((data) => {
      var strData = JSON.stringify(data);
      localStorage.setItem('allJobs', strData);
      totalJobs(); 
      listJobs();
      // document.getElementById('loaderAddJob').setAttribute('hidden', 'hidden');
    })
    .catch((error) => {
      // console.log(error);
      // error.JSON.parse('{"message:":"error"}')
    });
}
function totalJobs() {
    var allItems = JSON.parse(localStorage.getItem('allJobs'));
    var itemsLength = Object.keys(allItems).length;
    calc_totalJ.innerHTML = 'Total Jobs: ' + itemsLength;
}
function listJobs() {
    var allItems = JSON.parse(localStorage.getItem('allJobs'));
    itemsListJ.innerHTML = JSON.stringify(allItems);
}
function appendItem(evt) {
    evt.preventDefault();
    var allItems = JSON.parse(localStorage.getItem('allJobs'));
    var key = evt.srcElement[0].value;
    var val = evt.srcElement[1].value;
    allItems[key] = val;

    var allItemsStr = JSON.stringify(allItems);
    localStorage.setItem('allJobs', allItemsStr);

    totalJobs(); 
    listJobs();
}

function submitJob(evt) {
  document.getElementById('loaderAddJob').removeAttribute('hidden', 'hidden');
    fetch('php/ws.php?REQ_GET=createjob', {
      method: 'POST',
      body: JSON.stringify({
        contractor: evt.form[0].value,
        location: evt.form[1].value
      }),
      credentials: 'include'
  })
  .then((response) => response.json()) // *
  .then((contractor, location) => { // *
    var strData = JSON.stringify(contractor, location); // *
    localStorage.setItem('jobs', strData); // *
  document.getElementById('loaderAddJob').setAttribute('hidden', 'hidden');
  preFetchJ(); // updates without refresh
  });
}

//============ JOB LOG COMMENTS

preFetchC();
document.getElementById('addCommentForm').addEventListener('submit', 
        function(e) { appendItem(e) });
function preFetchC() { // axios is like fetch
  document.getElementById('loaderAddComment').removeAttribute('hidden', 'hidden');
    fetch('php/ws.php?REQ_GET=readjoblog', {
        method: 'GET',
        credentials: 'include'
    })
    .then((response) => response.json())
    .then((data) => {
      var strData = JSON.stringify(data);
      localStorage.setItem('allComments', strData);
      totalComments(); 
      listComments();
      document.getElementById('loaderAddComment').setAttribute('hidden', 'hidden');
    })
    .catch((error) => {
      // console.log(error);
      // error.JSON.parse('{"message:":"error"}')
    });
}
function totalComments() {
    var allItems = JSON.parse(localStorage.getItem('allComments'));
    var itemsLength = Object.keys(allItems).length;
    calc_totalC.innerHTML = 'Total Comments: ' + itemsLength;
}
function listComments() {
    var allItems = JSON.parse(localStorage.getItem('allComments'));
    itemsListC.innerHTML = JSON.stringify(allItems);
}
function appendItem(evt) {
    evt.preventDefault();
    var allItems = JSON.parse(localStorage.getItem('allComments'));
    var key = evt.srcElement[0].value;
    var val = evt.srcElement[1].value;
    allItems[key] = val;

    var allItemsStr = JSON.stringify(allItems);
    localStorage.setItem('allComments', allItemsStr);

    totalComments(); 
    listComments();
}

function submitComment(evt) {
  document.getElementById('loaderAddComment').removeAttribute('hidden', 'hidden');
  var jobID = evt.form[0].value;
  // var fd = new FormData();
  // fd.append('jobID', evt.form[0].value);
  // fd.append('comment', evt.form[1].value);
  fetch('php/ws.php?REQ_GET=createjoblog', {
    method: 'POST',
    body: JSON.stringify({
      jobID: jobID,
      comment: evt.form[1].value,
      technicianID: evt.form[0].value //session local storage login - set $sessionID
    }),
    credentials: 'include'
  })
  .then((response) => response.json()) // *
  .then((data) => { // *
    var strData = JSON.stringify(data); // *
    localStorage.setItem('comment', strData); // *
    document.getElementById('loaderAddComment').setAttribute('hidden', 'hidden');
    getThisJob(jobID); // updates without refresh
  });
}

//============ SUBMIT USERNAME PASSWORD

preFetchUP();
document.getElementById('addUPForm').addEventListener('submit', 
        function(e) { appendItem(e) });
function preFetchUP() { // axios is like fetch
  // document.getElementById('loaderAddUP').removeAttribute('hidden', 'hidden');
    fetch('php/ws.php?REQ_GET=readlogin', {
        method: 'GET',
        credentials: 'include'
    })
    .then((response) => response.json())
    .then((data) => {
      var strData = JSON.stringify(data);
      localStorage.setItem('allUP', strData);
      totalUP(); 
      listUP();
      // document.getElementById('loaderAddUP').setAttribute('hidden', 'hidden');
    })
    .catch((error) => {
      // console.log(error);
      // error.JSON.parse('{"message:":"error"}')
    });
}
function totalUP() {
    var allItems = JSON.parse(localStorage.getItem('allUP'));
    var itemsLength = Object.keys(allItems).length;
    calc_totalUP.innerHTML = 'Total Users: ' + itemsLength;
}
function listUP() {
    var allItems = JSON.parse(localStorage.getItem('allUP'));
    itemsListUP.innerHTML = JSON.stringify(allItems);
}
function appendItem(evt) {
    evt.preventDefault();
    var allItems = JSON.parse(localStorage.getItem('allUP'));
    var key = evt.srcElement[0].value;
    var val = evt.srcElement[1].value;
    allItems[key] = val;

    var allItemsStr = JSON.stringify(allItems);
    localStorage.setItem('allUP', allItemsStr);

    totalUP(); 
    listUP();
}

function submitLogin(evt) {
  document.getElementById('loaderAddUP').removeAttribute('hidden', 'hidden');
  fetch('./php/ws.php?REQ_GET=createlogin', {
    method: 'POST',
    body: JSON.stringify({
      username: evt.form[1].value,
      password: evt.form[2].value,
      technicianID: evt.form[0].value
    }),
    credentials: 'include'
  })
  .then((response) => response.json()) // *
  .then((data) => { // *
    var strData = JSON.stringify(data); // *
    localStorage.setItem('login', strData); // *
  document.getElementById('loaderAddUP').setAttribute('hidden', 'hidden');
  });
}

function submitImage(evt) {
  // var fd = new FormData();
  // fd.append('jobID', evt.form[0].value);
  // fd.append('jobID', evt.form[0].value);
  // fd.append('img', evt.form[1].value);
  fetch('./php/ws.php?REQ_GET=createqr', {
    method: 'POST',
    body: JSON.stringify({
      jobID: evt.form[0].value,
      img: evt.form[1].value
    }),
    credentials: 'include'
  });
}

// function submitTech(evt) {
//   var fd = new FormData();
//   // fd.append('jobID', evt.form[0].value);
//   fd.append('name', evt.form[0].value);
//   fd.append('surname', evt.form[1].value);
//   fd.append('email', evt.form[2].value);
//   fd.append('phone', evt.form[3].value);
//   fd.append('position', evt.form[4].value);
//   fetch('./php/ws.php?REQ_GET=addtechnician', {
//       method: 'POST',
//       body: fd,
//       credentials: 'include'
//   });
// }

// ============ TECHNICIAN

preFetchT();
// document.getElementById('addTechForm').addEventListener('submit', 
//         function(e) { appendItem(e) });
function preFetchT() { // axios is like fetch
  // document.getElementById('loaderAddUP').removeAttribute('hidden', 'hidden');
    fetch('php/ws.php?REQ_GET=readtechnician', {
        method: 'GET',
        credentials: 'include'
    })
    .then((response) => response.json())
    .then((data) => {
      var strData = JSON.stringify(data);
      localStorage.setItem('allTechs', strData);
      totalT(); 
      listT();
      // document.getElementById('loaderAddUP').setAttribute('hidden', 'hidden');
    })
    .catch((error) => {
      // console.log(error);
      // error.JSON.parse('{"message:":"error"}')
    });
}
function totalT() {
    var allItems = JSON.parse(localStorage.getItem('allTechs'));
    var itemsLength = Object.keys(allItems).length;
    calc_totalT.innerHTML = 'Total Techs: ' + itemsLength;
}
function listT() {
    var allItems = JSON.parse(localStorage.getItem('allTechs'));
    itemsListT.innerHTML = JSON.stringify(allItems);
}
function appendItem(evt) {
    evt.preventDefault();
    var allItems = JSON.parse(localStorage.getItem('allTechs'));
    var key = evt.srcElement[0].value;
    var val = evt.srcElement[1].value;
    allItems[key] = val;

    var allItemsStr = JSON.stringify(allItems);
    localStorage.setItem('allTechs', allItemsStr);

    totalT(); 
    listT();
}

function submitTech(evt) {
  document.getElementById('loaderAddTech').removeAttribute('hidden', 'hidden');
    fetch('php/ws.php?REQ_GET=createtechnician', {
      method: 'POST',
      body: JSON.stringify({
        name: evt.form[0].value,
        surname: evt.form[1].value,
        email: evt.form[2].value,
        phone: evt.form[3].value,
        position: evt.form[4].value,
      }),
      credentials: 'include'
  })
  .then((response) => response.json()) // *
  .then((name, surname, email, phone, position) => { // *
    var strData = JSON.stringify(name, surname, email, phone, position); // *
    localStorage.setItem('technician', strData); // *
  document.getElementById('loaderAddTech').setAttribute('hidden', 'hidden');
  preFetchT(); // updates without refresh
  });
}

// function submitTech(evt) {
//   // var fd = new FormData();
//   // fd.append('jobID', evt.form[0].value);
//   // fd.append('name', evt.form[0].value);
//   // fd.append('surname', evt.form[1].value);
//   // fd.append('email', evt.form[2].value);
//   // fd.append('phone', evt.form[3].value);
//   // fd.append('position', evt.form[4].value);
//   fetch('./php/ws.php?REQ_GET=createtechnician', {
//       method: 'POST',
//       body: JSON.stringify({
//         name: evt.form[0].value,
//         surname: evt.form[1].value,
//         email: evt.form[2].value,
//         phone: evt.form[3].value,
//         position: evt.form[4].value,
//       }),
//       credentials: 'include'
//   });
// }

// then (callback) exists for asynchronous


// function getAllJob(evt) {
//   var fd = new FormData();
//   // fd.append('jobID', evt.form[0].value);
//   fd.append('jobID', evt.form[0].value);
//   fd.append('contractor', evt.form[1].value);
//   fd.append('location', evt.form[2].value);
//   fetch('.localhost/php/ws.php?request_type=getalljob', {
//       method: 'GET',
//       body: fd,
//       credentials: 'include'
//   });
// }

// function validateForm() {
//   var x = document.forms["contractor"].value;
//   if (x == "") {
//     alert("name must be filled out");
//     return false;
//   }
// }

// console.log(localStorage);
// localStorage.clear(); // clear localStorage
// localStorage.setItem("name", "Loris"); //key = name, value = Loris
// localStorage.removeItem("name"); // remove key and value
// localStorage.setItem("phone", "0400112233"); // get item will give you value when pass in key
// localStorage.setItem("email", "loris@wirelog.com.au");

// localStorage.getItem("phone");  // get item will give you value when pass in key i.e returns "0400112233"
// localStorage.key(0); // will get key "name"

// const inputKey = document.getElementById('inputKey');
// const inputValue = document.getElementById('inputValue');
// const buttonInsert = document.getElementById('buttonInsert');
// const lsOutput = document.getElementById('lsOutput');

// buttonInsert.onclick = function lsFunction() {
//   const key = inputKey.value;
//   const value = inputValue.value;

//   // console.log(key);
//   // console.log(value);

//   if (key && value) {
//     localStorage.setItem(key, value);
//     location.reload();
//   }
// };

// // loop through key value pairs
// for (let i = 0; i < localStorage.length; i++) { //
//   const key = localStorage.key(i);
//   const value = localStorage.getItem(key);

//   lsOutput.innerHTML += `${key}: ${value}<br>`;
// }

// document.getElementById('errorAddTech').style.display="none";

// function validateForm() {
//   var a = document.forms["form1"]["name"].value;
//   var b = document.forms["form1"]["surname"].value;
//   var c = document.forms["form1"]["email"].value;
//   var d = document.forms["form1"]["phone"].value;
//   var e = document.forms["form1"]["position"].value;
//   if (a == null || a == "", b == null || b =="", c == null || c =="", d == null || d =="", e == null || e =="") {
//     document.getElementById('errorAddTech').style.display = "block";
//     setTimeout('errorAddTechX()',5000);
//   }
// }

// function errorAddJobX() {
//   document.getElementById('errorAddTech').style.display="none";
// }

// (function() {
//   'use strict';

//   window.addEventListener('load', function() {
//     var form = document.getElementById('addJobForm');
//     form.addEventListener('submit', function(event) {
//       if (form.checkValidity() === false) {
//         event.preventDefault();
//         event.stopPropagation();
//       }
//       form.classList.add('was-validated');
//     }, false);
//   }, false);
// })();

(function addCommentValidate() {
  'use strict';

  window.addEventListener('load', function() {
    var form = document.getElementById('addCommentForm');
    form.addEventListener('submit', function(event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
      event.preventDefault();
    }, false);
  }, false);
})();

(function addUserValidate() {
  'use strict';

  window.addEventListener('load', function() {
    var form = document.getElementById('addUPForm');
    form.addEventListener('submit', function(event) {
      if (form.checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
      event.preventDefault();
    }, false);
  }, false);
})();

// (function addJobValidate() {
//   'use strict';

//   window.addEventListener('load', function() {
//     var form = document.getElementById('addJobForm');
//     form.addEventListener('submit', function(event) {
//       if (form.checkValidity() === false) {
//         event.preventDefault();
//         event.stopPropagation();
//       }
//       form.classList.add('was-validated');
//       event.preventDefault();
//     }, false);
//   }, false);
// })();

// (function addTechValidate() {
//   'use strict';

//   window.addEventListener('load', function() {
//     var form = document.getElementById('addTechForm');
//     form.addEventListener('submit', function(event) {
//       if (form.checkValidity() === false) {
//         event.preventDefault();
//         event.stopPropagation();
//       }
//       form.classList.add('was-validated');
//       event.preventDefault();
//     }, false);
//   }, false);
// })();

/////////// TOOLTIP

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})