<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About This Project</title>
    <link rel="stylesheet" href="/styles.css">
</head>
<body>
    <!-- Background decoration -->
    <div class="bg-shape">
        <div class="shape1"></div>
        <div class="shape2"></div>
        <div class="shape3"></div>
    </div>

    <!-- NAVBAR -->
    <nav class="main-navbar">
        <div class="nav-container">
            <div class="logo">Hero Gallery</div>
            <ul class="nav-menu">
                <li><a href="/characters/">Home</a></li>
                <li><a href="/characters/about" class="active">About</a></li>
                <li><a href="/characters/add">Add Character</a></li>
            </ul>
        </div>
    </nav>

    <!-- Main content -->
    <div class="container">
        <a href="/characters/" class="back-btn">&#8592; Back to Gallery</a>

        <header class="header">
            <h1 class="title">About This Project</h1>
            <p class="subtitle">A full-stack Spring Boot MVC web app backed by a live PostgreSQL database.</p>
        </header>

        <div class="about-content-grid">
            <div class="about-content">

                <div class="info-box">
                    <h2 class="section-title">Why I Chose This Theme</h2>
                    <p class="section-text">I chose the My Hero Academia theme because it is one of my favorite shows
                        I have watched recently. It has characters with unique quirks and backstories. It allowed me
                        to practice creating a responsive and visually appealing web gallery while showcasing my
                        favorite characters from the series.</p>
                </div>

                <div class="info-box">
                    <h2 class="section-title">My Design Choices</h2>
                    <p class="section-text">I used a clean and modern design approach with a consistent color scheme
                        and typography. The MVC architecture cleanly separates concerns: the Controller handles
                        routing, the Service handles business logic, and FreeMarker templates handle the View layer.
                        Only CSS lives in the static folder — all HTML is served via FreeMarker templates.</p>
                </div>

                <div class="info-box">
                    <h2 class="section-title">What I Learned</h2>
                    <p class="section-text">Through this project I learned how to build a full-stack Spring Boot MVC
                        application with FreeMarker server-side rendering, connect it to a persistent PostgreSQL
                        database via Neon, and implement full CRUD operations (Create, Read, Update, Delete)
                        accessible from the browser without any JavaScript frameworks.</p>
                </div>

                <div class="info-box">
                    <h2 class="section-title">Tech Stack</h2>
                    <p class="section-text">
                        <strong>Backend:</strong> Java 25, Spring Boot 4, Spring MVC, Spring Data JPA<br>
                        <strong>Database:</strong> PostgreSQL (Neon cloud)<br>
                        <strong>View Layer:</strong> FreeMarker (.ftlh templates)<br>
                        <strong>Styling:</strong> Custom CSS (in static/)
                    </p>
                </div>

                <div class="info-box">
                    <h3 class="section-title">My Bio</h3>
                    <p class="section-text">Hello! I'm Abenezer and this is my first time learning and practicing
                        web development. I'm passionate about Computer Science mainly in embedded systems and ML.
                        This project was created as part of my learning journey for CSC 340.</p>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
