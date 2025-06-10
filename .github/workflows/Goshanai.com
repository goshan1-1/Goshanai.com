<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Flame Project - پرۆژەی Flame</title>
<!-- Tailwind CSS CDN -->
<script src="https://cdn.tailwindcss.com"></script>
<style>
  @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap');
  
  /* Base styles */
  body, html {
    margin: 0;
    padding: 0;
    min-height: 100vh;
    background-color: #000;
    color: #e2e8f0;
    font-family: 'Outfit', sans-serif;
    overflow-x: hidden;
    position: relative;
  }

  /* Starfield background */
  #starfield {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    pointer-events: none;
    background: radial-gradient(ellipse at center, rgba(30, 10, 50, 0.3) 0%, #000 100%);
  }

  /* Star styles */
  .star {
    position: absolute;
    width: 1px;
    height: 1px;
    background: linear-gradient(45deg, #7f7fff, #b37aff);
    border-radius: 50%;
    opacity: 0.8;
    filter: drop-shadow(0 0 2px rgba(127,127,255,0.8));
    animation: twinkle 5s infinite;
  }

  /* Shooting stars */
  .shooting-star {
    position: absolute;
    width: 100px;
    height: 1px;
    background: linear-gradient(90deg, rgba(0,0,0,0), #7f7fff, #b37aff);
    border-radius: 50%;
    box-shadow: 0 0 6px 2px #b37aff;
    transform: rotate(-45deg);
    animation: shoot 8s linear infinite;
    opacity: 0;
  }

  /* Animations */
  @keyframes twinkle {
    0%, 100% { opacity: 0.2; }
    50% { opacity: 1; }
  }

  @keyframes shoot {
    0% {
      transform: translateX(0) translateY(0) rotate(-45deg);
      opacity: 0;
    }
    10% {
      opacity: 1;
    }
    100% {
      transform: translateX(1000px) translateY(-1000px) rotate(-45deg);
      opacity: 0;
    }
  }

  /* Logo styles */
  .logo-flame {
    font-weight: 700;
    font-size: 2rem;
    color: #7f7fff;
    letter-spacing: 0.08em;
    position: relative;
    user-select: none;
  }
  .logo-flame sup {
    position: absolute;
    top: -0.6em;
    left: 50%;
    transform: translateX(-50%);
    font-size: 0.6em;
    color: #b37aff;
    font-family: monospace;
  }

  /* Kurdish text styling */
  .kurdish {
    font-size: 0.85rem;
    color: #aaaaff;
    margin-right: 0.5rem;
    font-style: italic;
  }

  /* Header styles */
  header {
    background: rgba(0, 0, 20, 0.85);
    backdrop-filter: saturate(180%) blur(10px);
    border-bottom: 1px solid #2a2a4a;
    position: sticky;
    top: 0;
    z-index: 100;
    padding: 1rem 2rem;
  }

  /* Content card styles */
  .card {
    background: rgba(20, 20, 40, 0.8);
    border-radius: 1rem;
    padding: 2rem;
    box-shadow: 0 0 20px rgba(100, 70, 200, 0.2);
    backdrop-filter: blur(5px);
    border: 1px solid #3a3a5a;
  }

  /* Buttons */
  .btn-primary {
    background-color: #7f7fff;
    color: #eee;
    font-weight: 600;
    padding: 0.75rem 1.5rem;
    border-radius: 0.75rem;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
  }
  .btn-primary:hover {
    background-color: #b37aff;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(127, 122, 255, 0.3);
  }

  /* Footer styles */
  footer {
    background: rgba(10, 10, 30, 0.9);
    padding: 1.5rem;
    text-align: center;
    font-size: 0.9rem;
    color: #6666cc;
    border-top: 1px solid #2a2a4a;
  }
</style>
</head>
<body>

<!-- Starfield Background -->
<div id="starfield"></div>

<!-- Header with Logo -->
<header class="flex justify-between items-center">
  <div class="flex items-center">
    <div class="logo-flame">
      flame<sup>2+2=1</sup>
    </div>
    <div class="ml-4 text-sm text-purple-300">
      <span class="en">Creator: Goshan mzafar</span>
      <span class="kurdish">دروستکەر: گۆشان مظفەر</span>
    </div>
  </div>
  <nav>
    <ul class="flex space-x-6">
      <li><a href="#" class="hover:text-purple-300 transition-colors">
        <span class="en">Home</span>
        <span class="kurdish">ماڵەوە</span>
      </a></li>
      <li><a href="#" class="hover:text-purple-300 transition-colors">
        <span class="en">Projects</span>
        <span class="kurdish">پرۆژەکان</span>
      </a></li>
      <li><a href="#" class="hover:text-purple-300 transition-colors">
        <span class="en">Contact</span>
        <span class="kurdish">پەیوەندی</span>
      </a></li>
    </ul>
  </nav>
</header>

<!-- Main Content -->
<main class="container mx-auto px-4 py-12 max-w-6xl">
  <section class="card mb-12">
    <h1 class="text-4xl font-bold mb-8 text-center">
      <span class="en">Flame Creative Studio</span>
      <span class="kurdish">ستۆدیۆی کریەیتیڤی Flame</span>
    </h1>
    
    <div class="grid md:grid-cols-2 gap-8 items-center">
      <div>
        <p class="mb-6 text-lg">
          <span class="en">Welcome to our creative space where ideas come to life.</span>
          <span class="kurdish">بەخێربێن بۆ بۆشایی کریەیتیڤمان کە بیرۆکەکان زیندوو دەبن.</span>
        </p>
        <p class="mb-8">
          <span class="en">Explore our projects and let's create something amazing together.</span>
          <span class="kurdish">پرۆژەکانمان بپشکنە و با بەیەکەوە شتێکی سەرسوڕهێنەر دروست بکەین.</span>
        </p>
        <button class="btn-primary">
          <span class="en">Get Started</span>
          <span class="kurdish">دەستپێبکە</span>
        </button>
      </div>
      
      <div class="relative h-64 bg-gradient-to-br from-purple-900 to-blue-900 rounded-xl overflow-hidden flex items-center justify-center">
        <div class="absolute inset-0 flex items-center justify-center">
          <div class="w-32 h-32 rounded-full bg-purple-600 opacity-20 blur-xl"></div>
        </div>
        <div class="relative z-10 text-center p-6">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 mx-auto mb-4 text-purple-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M13 10V3L4 14h7v7l9-11h-7z" />
          </svg>
          <p class="text-purple-200">
            <span class="en">Creative Solutions</span>
            <span class="kurdish">چارەسەرە کریەیتیڤەکان</span>
          </p>
        </div>
      </div>
    </div>
  </section>

  <section class="card">
    <h2 class="text-2xl font-bold mb-8 text-center">
      <span class="en">Our Services</span>
      <span class="kurdish">خزمەتگوزاریەکانمان</span>
    </h2>
    
    <div class="grid md:grid-cols-3 gap-6">
      <div class="bg-gradient-to-b from-blue-900/30 to-purple-900/20 p-6 rounded-xl border border-blue-800/50 hover:border-purple-500 transition-all duration-300">
        <div class="bg-blue-800/20 w-12 h-12 rounded-lg flex items-center justify-center mb-4">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-blue-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" />
          </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2 text-blue-200">
          <span class="en">Web Design</span>
          <span class="kurdish">دیزاینی وێب</span>
        </h3>
        <p class="text-blue-100 text-sm">
          <span class="en">Beautiful, responsive websites tailored to your needs.</span>
          <span class="kurdish">وێبسایتە جوان و وەڵامدەرەوەکان کە گونجاون بۆ پێداویستییەکانت.</span>
        </p>
      </div>
      
      <div class="bg-gradient-to-b from-purple-900/30 to-blue-900/20 p-6 rounded-xl border border-purple-800/50 hover:border-blue-500 transition-all duration-300">
        <div class="bg-purple-800/20 w-12 h-12 rounded-lg flex items-center justify-center mb-4">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-purple-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
          </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2 text-purple-200">
          <span class="en">Video Production</span>
          <span class="kurdish">بەرهەمهێنانی ڤیدیۆ</span>
        </h3>
        <p class="text-purple-100 text-sm">
          <span class="en">Professional video editing and production services.</span>
          <span class="kurdish">خزمەتگوزاری پڕۆفیشناڵی دەستکاری و بەرهەمهێنانی ڤیدیۆ.</span>
        </p>
      </div>
      
      <div class="bg-gradient-to-b from-blue-900/30 to-purple-900/20 p-6 rounded-xl border border-blue-800/50 hover:border-purple-500 transition-all duration-300">
        <div class="bg-blue-800/20 w-12 h-12 rounded-lg flex items-center justify-center mb-4">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-blue-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" />
          </svg>
        </div>
        <h3 class="text-xl font-semibold mb-2 text-blue-200">
          <span class="en">Creative Solutions</span>
          <span class="kurdish">چارەسەرە کریەیتیڤەکان</span>
        </h3>
        <p class="text-blue-100 text-sm">
          <span class="en">Innovative approaches to your creative challenges.</span>
          <span class="kurdish">ڕێگاکانی نوێکارانە بۆ ململانێ کریەیتیڤەکانت.</span>
        </p>
      </div>
    </div>
  </section>
</main>

<!-- Footer -->
<footer>
  <p>
    <span class="en">© 2023 Flame Creative Studio. All rights reserved.</span>
    <span class="kurdish">© ٢٠٢٣ ستۆدیۆی کریەیتیڤی Flame. هەموو مافەکان پارێزراون.</span>
  </p>
</footer>

<script>
// Create stars
function createStars() {
  const starfield = document.getElementById('starfield');
  
  // Create static stars
  for (let i = 0; i < 200; i++) {
    const star = document.createElement('div');
    star.className = 'star';
    star.style.left = `${Math.random() * 100}%`;
    star.style.top = `${Math.random() * 100}%`;
    star.style.width = `${Math.random() * 2 + 1}px`;
    star.style.height = star.style.width;
    star.style.opacity = Math.random() * 0.5 + 0.3;
    star.style.animationDelay = `${Math.random() * 5}s`;
    starfield.appendChild(star);
  }

  // Create shooting stars
  for (let i = 0; i < 5; i++) {
    createShootingStar(i * 2000);
  }
}

function createShootingStar(delay = 0) {
  setTimeout(() => {
    const shootingStar = document.createElement('div');
    shootingStar.className = 'shooting-star';
    shootingStar.style.left = `${Math.random() * 100}%`;
    shootingStar.style.top = `${Math.random() * 100}%`;
    shootingStar.style.animationDuration = `${Math.random() * 5 + 5}s`;
    document.getElementById('starfield').appendChild(shootingStar);
    
    // Remove after animation completes and create a new one
    shootingStar.addEventListener('animationend', () => {
      shootingStar.remove();
      createShootingStar(Math.random() * 5000);
    });
  }, delay);
}

// Initialize when page loads
window.addEventListener('DOMContentLoaded', () => {
  createStars();
});

// Handle window resize
window.addEventListener('resize', () => {
  const stars = document.querySelectorAll('.star');
  stars.forEach(star => {
    star.style.left = `${Math.random() * 100}%`;
    star.style.top = `${Math.random() * 100}%`;
  });
});
</script>
</body>
</html>
