<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Page Not Found | SMARTHIRE</title>

    <link rel="icon" type="image/svg+xml" href="favicon.svg" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link
      href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
      rel="stylesheet"
    />

    <!-- Font Awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    />

    <style>
      /* =====================================================
           SMARTHIRE 404 PAGE
           ===================================================== */

      :root {
        --ink: #13211e;
        --mint: #d9f67f;
        --coral: #f27961;
        --paper: #f4f1e8;
        --line: #d6ddd1;
        --muted: #6f7d77;
        --white: #ffffff;
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      html {
        scroll-behavior: smooth;
      }

      body {
        min-height: 100vh;
        background: var(--paper);
        color: var(--ink);
        font-family: "DM Sans", sans-serif;

        display: flex;
        flex-direction: column;

        overflow-x: hidden;
      }

      /* =====================================================
           NAVBAR
           ===================================================== */

      .navbar {
        height: 76px;
        padding: 0 6%;

        display: flex;
        align-items: center;
        justify-content: space-between;

        border-bottom: 1px solid var(--line);

        background: rgba(244, 241, 232, 0.94);

        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);

        position: relative;
        z-index: 5;
      }

      /* Logo */

      .logo {
        display: inline-flex;
        align-items: center;
        gap: 10px;

        text-decoration: none;
        color: var(--ink);

        font-family: "Space Grotesk", sans-serif;
        font-size: 24px;
        font-weight: 700;

        letter-spacing: -1px;

        transition: opacity 0.2s ease;
      }

      .logo:hover {
        opacity: 0.85;
      }

      .logo-icon {
        width: 38px;
        height: 38px;

        display: flex;
        align-items: center;
        justify-content: center;

        background: var(--mint);

        border-radius: 10px;

        font-size: 17px;

        transition: transform 0.25s ease;
      }

      .logo:hover .logo-icon {
        transform: rotate(-8deg) scale(1.04);
      }

      /* Back Home */

      .nav-home {
        display: inline-flex;
        align-items: center;
        gap: 8px;

        text-decoration: none;
        color: var(--ink);

        font-size: 14px;
        font-weight: 600;

        transition: all 0.2s ease;
      }

      .nav-home i {
        font-size: 13px;

        transition: transform 0.2s ease;
      }

      .nav-home:hover {
        opacity: 0.7;
      }

      .nav-home:hover i {
        transform: translateX(-3px);
      }

      /* =====================================================
           MAIN
           ===================================================== */

      .error-wrapper {
        flex: 1;

        position: relative;

        display: flex;
        align-items: center;
        justify-content: center;

        padding: 70px 20px 80px;

        overflow: hidden;
      }

      /* =====================================================
           DECORATIVE BACKGROUND SHAPES
           ===================================================== */

      .shape {
        position: absolute;

        pointer-events: none;

        opacity: 0.55;
      }

      .shape-one {
        width: 250px;
        height: 250px;

        border: 1px solid var(--line);

        border-radius: 50%;

        left: -100px;
        top: 12%;

        animation: floatOne 7s ease-in-out infinite;
      }

      .shape-two {
        width: 180px;
        height: 180px;

        border-radius: 35px;

        background: rgba(217, 246, 127, 0.22);

        right: -65px;
        bottom: 15%;

        transform: rotate(18deg);

        animation: floatTwo 8s ease-in-out infinite;
      }

      .shape-three {
        width: 12px;
        height: 12px;

        border-radius: 50%;

        background: var(--coral);

        right: 17%;
        top: 22%;
      }

      .shape-four {
        width: 8px;
        height: 8px;

        border-radius: 50%;

        background: var(--ink);

        left: 18%;
        bottom: 22%;
      }

      /* =====================================================
           ERROR CONTAINER
           ===================================================== */

      .error-container {
        width: 100%;
        max-width: 850px;

        text-align: center;

        position: relative;
        z-index: 2;

        animation: pageEnter 0.65s ease both;
      }

      /* =====================================================
           ERROR NUMBER
           ===================================================== */

      .error-number {
        display: flex;
        justify-content: center;
        align-items: center;

        margin-bottom: 34px;
      }

      .error-number span {
        display: inline-block;

        padding: 8px 30px 15px;

        background: var(--mint);

        border-radius: 38px;

        color: var(--ink);

        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(120px, 19vw, 220px);

        font-weight: 700;

        line-height: 0.78;

        letter-spacing: -12px;

        transform: rotate(-3deg);

        box-shadow: 0 18px 40px rgba(19, 33, 30, 0.06);

        animation: numberFloat 5s ease-in-out infinite;
      }

      /* =====================================================
           ICON
           ===================================================== */

      .error-icon {
        width: 64px;
        height: 64px;

        margin: 0 auto 20px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 18px;

        background: var(--coral);

        color: var(--ink);

        font-size: 24px;

        box-shadow: 0 12px 28px rgba(242, 121, 97, 0.18);

        transform: rotate(-4deg);

        transition:
          transform 0.25s ease,
          box-shadow 0.25s ease;
      }

      .error-icon:hover {
        transform: rotate(0deg) scale(1.05);

        box-shadow: 0 16px 32px rgba(242, 121, 97, 0.24);
      }

      /* =====================================================
           HEADING
           ===================================================== */

      h1 {
        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(32px, 5vw, 52px);

        line-height: 1.05;

        letter-spacing: -2px;

        margin-bottom: 16px;
      }

      .description {
        max-width: 570px;

        margin: 0 auto 32px;

        color: var(--muted);

        font-size: 16px;

        line-height: 1.75;
      }

      /* =====================================================
           BUTTONS
           ===================================================== */

      .buttons {
        display: flex;

        justify-content: center;
        align-items: center;

        gap: 12px;

        flex-wrap: wrap;
      }

      .btn {
        min-height: 48px;

        padding: 13px 21px;

        display: inline-flex;
        align-items: center;
        justify-content: center;

        gap: 9px;

        border-radius: 11px;

        text-decoration: none;

        font-size: 13px;
        font-weight: 700;

        transition:
          transform 0.22s ease,
          box-shadow 0.22s ease,
          background 0.22s ease;
      }

      /* Home */

      .btn-primary {
        background: var(--ink);
        color: var(--white);
      }

      .btn-primary i {
        color: var(--mint);
      }

      .btn-primary:hover {
        transform: translateY(-3px);

        box-shadow: 0 12px 25px rgba(19, 33, 30, 0.16);
      }

      /* Browse Jobs */

      .btn-secondary {
        background: rgba(255, 255, 255, 0.55);

        color: var(--ink);

        border: 1px solid #cbd4ca;
      }

      .btn-secondary:hover {
        background: var(--white);

        transform: translateY(-3px);

        box-shadow: 0 10px 22px rgba(19, 33, 30, 0.07);
      }

      /* =====================================================
           SMALL HELP TEXT
           ===================================================== */

      .help-text {
        margin-top: 24px;

        color: #89938e;

        font-size: 11px;

        display: flex;
        justify-content: center;
        align-items: center;

        gap: 7px;
      }

      .help-text i {
        font-size: 10px;

        color: var(--coral);
      }

      /* =====================================================
           FOOTER
           ===================================================== */

      .footer {
        padding: 20px 6%;

        border-top: 1px solid var(--line);

        display: flex;
        align-items: center;
        justify-content: space-between;

        color: #71807b;

        font-size: 12px;

        background: rgba(244, 241, 232, 0.75);
      }

      .status {
        display: flex;
        align-items: center;

        gap: 7px;
      }

      .status-dot {
        width: 7px;
        height: 7px;

        border-radius: 50%;

        background: #72b85b;

        box-shadow: 0 0 0 4px rgba(114, 184, 91, 0.1);
      }

      /* =====================================================
           ANIMATIONS
           ===================================================== */

      @keyframes pageEnter {
        from {
          opacity: 0;
          transform: translateY(16px);
        }

        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @keyframes numberFloat {
        0%,
        100% {
          transform: rotate(-3deg) translateY(0);
        }

        50% {
          transform: rotate(-3deg) translateY(-5px);
        }
      }

      @keyframes floatOne {
        0%,
        100% {
          transform: translateY(0);
        }

        50% {
          transform: translateY(-18px);
        }
      }

      @keyframes floatTwo {
        0%,
        100% {
          transform: rotate(18deg) translateY(0);
        }

        50% {
          transform: rotate(24deg) translateY(-14px);
        }
      }

      /* =====================================================
           RESPONSIVE
           ===================================================== */

      @media (max-width: 600px) {
        .navbar {
          height: 68px;

          padding: 0 5%;
        }

        .logo {
          font-size: 20px;
        }

        .logo-icon {
          width: 34px;
          height: 34px;

          font-size: 15px;
        }

        .nav-home {
          font-size: 12px;
        }

        .error-wrapper {
          padding: 55px 18px 65px;
        }

        .error-number span {
          padding: 8px 19px 12px;

          letter-spacing: -7px;
        }

        .error-icon {
          width: 56px;
          height: 56px;

          border-radius: 15px;

          font-size: 21px;

          margin-bottom: 18px;
        }

        h1 {
          font-size: 32px;

          letter-spacing: -1.4px;
        }

        .description {
          font-size: 14px;

          line-height: 1.7;
        }

        .buttons {
          flex-direction: column;

          width: 100%;
        }

        .btn {
          width: 100%;

          max-width: 300px;
        }

        .footer {
          padding: 18px 5%;

          flex-direction: column;

          gap: 8px;

          text-align: center;
        }
      }

      /* =====================================================
           REDUCED MOTION
           ===================================================== */

      @media (prefers-reduced-motion: reduce) {
        *,
        *::before,
        *::after {
          animation-duration: 0.01ms !important;

          animation-iteration-count: 1 !important;

          scroll-behavior: auto !important;
        }
      }
    </style>
  </head>

  <body>
    <!-- =====================================================
         NAVBAR
         ===================================================== -->

    <nav class="navbar">
      <!-- HOME URL:
             http://localhost:8080/home.jsp -->

      <a href="/home.jsp" class="logo">
        <span class="logo-icon">
          <i class="fa-solid fa-bolt"></i>
        </span>

        SMARTHIRE
      </a>

      <!-- HOME URL:
             http://localhost:8080/home.jsp -->

      <a href="/home.jsp" class="nav-home">
        <i class="fa-solid fa-arrow-left"></i>

        Back to Home
      </a>
    </nav>

    <!-- =====================================================
         MAIN ERROR CONTENT
         ===================================================== -->

    <main class="error-wrapper">
      <!-- Decorative elements -->

      <div class="shape shape-one"></div>

      <div class="shape shape-two"></div>

      <div class="shape shape-three"></div>

      <div class="shape shape-four"></div>

      <div class="error-container">
        <!-- 404 -->

        <div class="error-number">
          <span>404</span>
        </div>

        <!-- Icon -->

        <div class="error-icon">
          <i class="fa-solid fa-compass"></i>
        </div>

        <!-- Heading -->

        <h1>Looks like you're lost.</h1>

        <!-- Description -->

        <p class="description">
          The page you're looking for doesn't exist, may have been moved, or the
          address might be incorrect. Let's get you back to discovering your
          next career opportunity.
        </p>

        <!-- Actions -->

        <div class="buttons">
          <!--
                    HOME
                    http://localhost:8080/home.jsp
                -->

          <a href="/home.jsp" class="btn btn-primary">
            <i class="fa-solid fa-house"></i>

            Go to Home
          </a>

          <!--
                    BROWSE JOBS
                    http://localhost:8080/viewjob
                -->

          <a href="/viewjob" class="btn btn-secondary">
            <i class="fa-solid fa-magnifying-glass"></i>

            Browse Jobs
          </a>
        </div>

        <!-- Small reassurance -->

        <div class="help-text">
          <i class="fa-solid fa-circle-info"></i>

          You can use the navigation above to continue exploring SMARTHIRE.
        </div>
      </div>
    </main>

    <!-- =====================================================
         FOOTER
         ===================================================== -->

    <footer class="footer">
      <span> © 2026 SMARTHIRE </span>

      <span class="status">
        <span class="status-dot"></span>

        Job opportunities are waiting
      </span>
    </footer>
  </body>
</html>
