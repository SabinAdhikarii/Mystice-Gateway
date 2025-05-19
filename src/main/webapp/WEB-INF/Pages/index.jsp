<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mystic Gateway</title>
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/CSS/styles.css">
</head>
<body>
  <header class="navbar">
    <div class="logo">
      <h2><b><I> Mystic GateWay</I></b></h2>
    </div>
    <nav class="nav-links">
      <a href="#">About Us</a>
      <a href="#">Contact</a>
      <a href="${pageContext.request.contextPath}/Signup">Sign Up</a>
      <a href="${pageContext.request.contextPath}/Login">Sign in</a>
    </nav>
  </header>

  <main class="hero-section"></main>
  <section class="section-about">
    <div class="about-text">
      <h4>Welcome to Mystic Gateway Travels and Tours</h4>
      <h1>Looking for a better <br> Travel Agency in Nepal?</h1>
      <p>Mystic Gateway Travels and Tours Pvt. Ltd is a local travel agency in Nepal based in Kathmandu, that welcomes you to Nepal for exciting treks, tours, and adventurous activities. With 15+ years of experience in the tourism field, we aim to curate journeys that ignite your wanderlust and create experiences in the Land of the Himalayas, Nepal.</p>
      <p>Explore the 8th wonder of the world as we take you on a voyage through enchanting landscapes, ancient winders, and vibrant cultures. We are officially registered as a travel company by the Government of Nepal – Ministry of Culture, Tourism and Civil Aviation in 2007 A.D.</p>
      
      <div class="whatsapp-box">
        <img src="${pageContext.request.contextPath}/Resources/whatsaap.jpg" alt="WhatsApp Icon">
        <div>
          <div>WhatsApp</div>
          <div>+977-9843 7648 33</div>
        </div>
      </div>
    </div>
  
    <div class="about-image">
      <img src="${pageContext.request.contextPath}/Resources/Freepik1.webp" alt="Helping on mountain">
    </div>
  </section>
  <section class="section-guidance">
    <h2>Expert guidance to help you <br> plan your trip</h2>
    
    <div class="guidance-grid">
      <div class="card">
        <h3><span class="card-icon">🏅</span>Best Things to Do</h3>
        <p>The Himalaya is Nepal’s main attraction, it’s true. Yet there are range of other unforgettable experiences to take in in this mountain country, too.</p>
        <a href="#">Read article →</a>
      </div>
  
      <div class="card">
        <h3><span class="card-icon">🥇</span>Best Places to Visit</h3>
        <p>Don't miss the best of Nepal with our guide to the top places to visit.</p>
        <a href="#">Read article →</a>
      </div>
  
      <div class="card">
        <h3><span class="card-icon">📅</span>Best Time to Visit</h3>
        <p>Whether you're after mountain adventures or dynamic festivals, timing is a key part of a trip to Nepal. Here's how to choose the best month for your needs.</p>
        <a href="#">Read article →</a>
      </div>
  
      <div class="card">
        <h3><span class="card-icon">🚌</span>Transportation</h3>
        <p>Exploring Nepal is tempting – but not always easy. Here’s all you need to know about buses, private cars, flights and more within the Himalayan country.</p>
        <a href="#">Read article →</a>
      </div>
    </div>
  </section>
  
  
</body>
</html>
