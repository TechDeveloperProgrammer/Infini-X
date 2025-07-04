
// Custom JavaScript for Infini-X Documentation

console.log("Infini-X Documentation Loaded!");

// Example: Add a custom scroll-to-top button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("scrollToTopBtn").style.display = "block";
  } else {
    document.getElementById("scrollToTopBtn").style.display = "none";
  }
}

function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

// Add a button to the footer (conceptual)
// document.addEventListener('DOMContentLoaded', (event) => {
//   const footer = document.querySelector('.md-footer-nav');
//   if (footer) {
//     const btn = document.createElement('button');
//     btn.id = "scrollToTopBtn";
//     btn.textContent = "Top";
//     btn.onclick = topFunction;
//     btn.style.display = "none";
//     btn.style.position = "fixed";
//     btn.style.bottom = "20px";
//     btn.style.right = "30px";
//     btn.style.zIndex = "99";
//     btn.style.border = "none";
//     btn.style.outline = "none";
//     btn.style.backgroundColor = "#555";
//     btn.style.color = "white";
//     btn.style.cursor = "pointer";
//     btn.style.padding = "15px";
//     btn.style.borderRadius = "10px";
//     btn.style.fontSize = "18px";
//     footer.appendChild(btn);
//   }
// });
