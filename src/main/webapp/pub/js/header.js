
function addUnderline(teamName) {
    let link = document.getElementById(teamName);
    link.style.cssText = "text-decoration: underline";
    link.style.textUnderlineOffset = "6px";
}

function removeUnderline(teamName) {
    let link = document.getElementById(teamName);
    link.style.cssText = "text-decoration: none";
}




// const links = document.querySelectorAll(".header-link");

// links.forEach((link) => {
//     link.addEventListener("mouseover", (event) => {
//         event.target.style.cssText = "text-decoration: underline";
//     });
// });