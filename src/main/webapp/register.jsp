<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <meta
      name="description"
      content="Register at SMARTHIRE - Create your account as a Job Seeker or Recruiter"
    />

    <title>Register | SMARTHIRE</title>

    <link rel="icon" href="favicon.svg" type="image/svg+xml" />

    <!-- Fonts -->
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
      :root {
        --ink: #13211e;
        --mint: #d9f67f;
        --coral: #f27961;
        --paper: #f4f1e8;
        --white: #ffffff;
        --muted: #718078;
        --line: #d6ddd1;
        --soft: #edf1e9;
        --danger: #c95d4e;
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "DM Sans", sans-serif;
        background: var(--paper);
        color: var(--ink);
        min-height: 100vh;
      }

      a {
        text-decoration: none;
        color: inherit;
      }

      button,
      input,
      select {
        font-family: inherit;
      }

      /* =====================================
           NAVBAR
        ===================================== */

      .auth-navbar {
        height: 76px;

        display: flex;
        align-items: center;

        background: rgba(244, 241, 232, 0.94);

        border-bottom: 1px solid var(--line);

        position: relative;
        z-index: 10;
      }

      .auth-nav-container {
        width: min(1180px, calc(100% - 50px));

        margin: auto;

        display: flex;
        align-items: center;
        justify-content: space-between;
      }

      .auth-brand {
        display: flex;
        align-items: center;
        gap: 11px;
      }

      .auth-logo-icon {
        width: 40px;
        height: 40px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 11px;

        background: var(--ink);
        color: var(--mint);

        font-size: 16px;
      }

      .auth-brand-name {
        display: block;

        font-family: "Space Grotesk", sans-serif;

        font-size: 18px;
        font-weight: 700;

        letter-spacing: -0.5px;
      }

      .auth-brand-sub {
        display: block;

        margin-top: 1px;

        color: var(--muted);

        font-size: 9px;

        letter-spacing: 0.1px;
      }

      .auth-nav-links {
        display: flex;
        align-items: center;
        gap: 9px;
      }

      .auth-nav-link {
        display: inline-flex;
        align-items: center;
        gap: 6px;

        min-height: 38px;

        padding: 0 12px;

        color: #56635d;

        font-size: 12px;
        font-weight: 600;

        border-radius: 8px;

        transition: 0.25s ease;
      }

      .auth-nav-link:hover {
        color: var(--ink);
        background: rgba(19, 33, 30, 0.05);
      }

      .auth-nav-btn {
        min-height: 38px;

        display: inline-flex;
        align-items: center;
        justify-content: center;

        padding: 0 16px;

        border-radius: 9px;

        background: var(--ink);
        color: white;

        font-size: 12px;
        font-weight: 700;

        transition: 0.25s ease;
      }

      .auth-nav-btn:hover {
        background: #20332f;

        transform: translateY(-2px);

        box-shadow: 0 7px 16px rgba(19, 33, 30, 0.12);
      }

      /* =====================================
           MAIN AUTH PAGE
        ===================================== */

      .auth-page {
        min-height: calc(100vh - 76px);

        display: flex;
        align-items: center;
        justify-content: center;

        padding: 38px 25px 55px;
      }

      .auth-container {
        width: min(1080px, 100%);

        display: grid;

        grid-template-columns: 1fr 430px;

        overflow: hidden;

        border: 1px solid var(--line);

        border-radius: 24px;

        background: white;

        box-shadow: 0 25px 65px rgba(19, 33, 30, 0.09);

        animation: pageEnter 0.55s ease both;
      }

      /* =====================================
           LEFT PANEL
        ===================================== */

      .auth-left {
        position: relative;

        min-height: 650px;

        overflow: hidden;

        background: var(--ink);

        color: white;

        display: flex;
        align-items: center;

        padding: 60px;
      }

      .auth-left::before {
        content: "";

        position: absolute;

        width: 440px;
        height: 440px;

        border-radius: 50%;

        background: var(--mint);

        opacity: 0.07;

        right: -180px;
        top: -160px;
      }

      .auth-left::after {
        content: "";

        position: absolute;

        width: 260px;
        height: 260px;

        border-radius: 50%;

        border: 1px solid rgba(217, 246, 127, 0.16);

        left: -150px;
        bottom: -120px;
      }

      .auth-left-content {
        position: relative;

        z-index: 2;

        max-width: 500px;
      }

      .auth-badge {
        display: inline-flex;
        align-items: center;

        margin-bottom: 25px;

        padding: 7px 11px;

        border: 1px solid rgba(217, 246, 127, 0.2);

        border-radius: 50px;

        color: var(--mint);

        background: rgba(217, 246, 127, 0.06);

        font-size: 9px;
        font-weight: 700;

        letter-spacing: 1.3px;
      }

      .auth-left h1 {
        font-family: "Space Grotesk", sans-serif;

        font-size: clamp(34px, 4vw, 52px);

        line-height: 1.03;

        letter-spacing: -2px;
      }

      .auth-left h1 span {
        color: var(--mint);
      }

      .auth-left p {
        max-width: 470px;

        margin-top: 22px;

        color: #aebbb5;

        font-size: 14px;

        line-height: 1.7;
      }

      .auth-features {
        display: flex;
        flex-direction: column;
        gap: 13px;

        margin-top: 30px;
      }

      .auth-feature {
        display: flex;
        align-items: center;
        gap: 10px;

        color: #d4ddd8;

        font-size: 13px;
      }

      .auth-feature i {
        color: var(--mint);

        font-size: 14px;
      }

      /* =====================================
           REGISTER CARD
        ===================================== */

      .auth-card {
        padding: 43px 42px 38px;

        background: white;
      }

      .auth-card-header {
        text-align: center;

        margin-bottom: 28px;
      }

      .auth-card-icon {
        width: 47px;
        height: 47px;

        display: flex;
        align-items: center;
        justify-content: center;

        margin: 0 auto 14px;

        border-radius: 13px;

        background: #edf4e0;

        color: #536e32;

        font-size: 17px;
      }

      .auth-card-header h2 {
        font-family: "Space Grotesk", sans-serif;

        font-size: 26px;

        letter-spacing: -0.8px;
      }

      .subtitle {
        margin-top: 5px;

        color: var(--muted);

        font-size: 12px;
      }

      /* =====================================
           FORM
        ===================================== */

      .auth-form {
        display: flex;
        flex-direction: column;
        gap: 17px;
      }

      .auth-input-group {
        display: flex;
        flex-direction: column;
        gap: 7px;
      }

      .auth-input-group label {
        display: flex;
        align-items: center;
        gap: 7px;

        color: #4d5b54;

        font-size: 11px;
        font-weight: 700;
      }

      .auth-input-group label i {
        width: 14px;

        color: var(--coral);

        text-align: center;
      }

      .auth-input-group input,
      .auth-input-group select {
        width: 100%;

        height: 44px;

        padding: 0 13px;

        border: 1px solid var(--line);

        border-radius: 10px;

        outline: none;

        background: #fafbf8;

        color: var(--ink);

        font-size: 12px;

        transition:
          border-color 0.25s ease,
          box-shadow 0.25s ease,
          background 0.25s ease;
      }

      .auth-input-group input::placeholder {
        color: #9aa59f;
      }

      .auth-input-group input:focus,
      .auth-input-group select:focus {
        border-color: var(--ink);

        background: white;

        box-shadow: 0 0 0 4px rgba(19, 33, 30, 0.05);
      }

      .auth-input-group select {
        cursor: pointer;

        appearance: none;

        background-image:
          linear-gradient(45deg, transparent 50%, #718078 50%),
          linear-gradient(135deg, #718078 50%, transparent 50%);

        background-position:
          calc(100% - 17px) 18px,
          calc(100% - 12px) 18px;

        background-size:
          5px 5px,
          5px 5px;

        background-repeat: no-repeat;

        padding-right: 35px;
      }

      /* =====================================
           PASSWORD
        ===================================== */

      .password-wrapper {
        position: relative;
      }

      .password-wrapper input {
        padding-right: 43px;
      }

      .pw-toggle {
        position: absolute;

        top: 50%;
        right: 10px;

        transform: translateY(-50%);

        width: 30px;
        height: 30px;

        display: flex;
        align-items: center;
        justify-content: center;

        border: none;

        background: transparent;

        color: #89958e;

        cursor: pointer;

        border-radius: 7px;

        transition: 0.2s ease;
      }

      .pw-toggle:hover {
        background: var(--soft);

        color: var(--ink);
      }

      /* =====================================
           REGISTER BUTTON
        ===================================== */

      .register-btn {
        width: 100%;

        height: 45px;

        margin-top: 4px;

        border: none;

        border-radius: 10px;

        background: var(--ink);

        color: white;

        font-size: 12px;
        font-weight: 700;

        cursor: pointer;

        transition:
          transform 0.25s ease,
          box-shadow 0.25s ease,
          background 0.25s ease;
      }

      .register-btn:hover {
        background: #20332f;

        transform: translateY(-2px);

        box-shadow: 0 9px 20px rgba(19, 33, 30, 0.14);
      }

      .register-btn:active {
        transform: translateY(0);
      }

      /* =====================================
           LOGIN SWITCH
        ===================================== */

      .auth-switch {
        margin-top: 23px;

        padding-top: 20px;

        border-top: 1px solid #edf0eb;

        text-align: center;

        color: var(--muted);

        font-size: 11px;
      }

      .auth-switch a {
        color: var(--ink);

        font-weight: 700;

        transition: 0.2s ease;
      }

      .auth-switch a:hover {
        color: var(--coral);
      }

      /* =====================================
           ANIMATION
        ===================================== */

      @keyframes pageEnter {
        from {
          opacity: 0;

          transform: translateY(14px);
        }

        to {
          opacity: 1;

          transform: translateY(0);
        }
      }

      /* =====================================
           RESPONSIVE
        ===================================== */

      @media (max-width: 900px) {
        .auth-container {
          grid-template-columns: 1fr;
        }

        .auth-left {
          min-height: auto;

          padding: 45px 45px;
        }

        .auth-left h1 {
          font-size: 38px;
        }

        .auth-features {
          flex-direction: row;
          flex-wrap: wrap;
        }

        .auth-card {
          max-width: 520px;

          width: 100%;

          margin: auto;
        }
      }

      @media (max-width: 600px) {
        .auth-navbar {
          height: 68px;
        }

        .auth-nav-container {
          width: calc(100% - 30px);
        }

        .auth-brand-sub {
          display: none;
        }

        .auth-nav-link {
          font-size: 0;
        }

        .auth-nav-link i {
          font-size: 14px;
        }

        .auth-page {
          padding: 20px 15px 35px;
        }

        .auth-left {
          padding: 35px 27px;
        }

        .auth-left h1 {
          font-size: 33px;

          letter-spacing: -1.3px;
        }

        .auth-left p {
          font-size: 13px;
        }

        .auth-features {
          flex-direction: column;
        }

        .auth-card {
          padding: 32px 23px;
        }
      }

      @media (max-width: 400px) {
        .auth-brand-name {
          font-size: 16px;
        }

        .auth-nav-btn {
          padding: 0 12px;
        }

        .auth-left {
          padding: 30px 22px;
        }

        .auth-left h1 {
          font-size: 29px;
        }

        .auth-card {
          padding: 28px 18px;
        }
      }
    </style>
  </head>

  <body>
    <!-- =====================================
     NAVBAR
===================================== -->

    <nav class="auth-navbar">
      <div class="auth-nav-container">
        <a
          href="${pageContext.request.contextPath}/home.jsp"
          class="auth-brand"
        >
          <div class="auth-logo-icon">
            <i class="fa-solid fa-briefcase"></i>
          </div>

          <div>
            <span class="auth-brand-name"> SMARTHIRE </span>

            <span class="auth-brand-sub">
              Recruitment Management Platform
            </span>
          </div>
        </a>

        <div class="auth-nav-links">
          <a
            href="${pageContext.request.contextPath}/home.jsp"
            class="auth-nav-link"
          >
            <i class="fa-solid fa-house"></i>

            <span>Home</span>
          </a>

          <a
            href="${pageContext.request.contextPath}/login.jsp"
            class="auth-nav-btn"
          >
            Login
          </a>
        </div>
      </div>
    </nav>

    <!-- =====================================
     MAIN
===================================== -->

    <div class="auth-page">
      <div class="auth-container">
        <!-- =================================
             LEFT PANEL
        ================================== -->

        <div class="auth-left">
          <div class="auth-left-content">
            <div class="auth-badge">CREATE ACCOUNT</div>

            <h1>
              Start Your
              <span>Career Journey</span>
              Today
            </h1>

            <p>
              Join SMARTHIRE and connect with the opportunities and talent that
              matter. Create your account and take the next step in your
              professional journey.
            </p>

            <div class="auth-features">
              <div class="auth-feature">
                <i class="fa-solid fa-circle-check"></i>

                Free to register
              </div>

              <div class="auth-feature">
                <i class="fa-solid fa-circle-check"></i>

                Apply instantly
              </div>

              <div class="auth-feature">
                <i class="fa-solid fa-circle-check"></i>

                Post jobs for free
              </div>
            </div>
          </div>
        </div>

        <!-- =================================
             REGISTER CARD
        ================================== -->

        <div class="auth-card">
          <div class="auth-card-header">
            <div class="auth-card-icon">
              <i class="fa-solid fa-user-plus"></i>
            </div>

            <h2>Create Account</h2>

            <p class="subtitle">Register to continue</p>
          </div>

          <form
            action="${pageContext.request.contextPath}/register"
            method="post"
            class="auth-form"
          >
            <!-- FULL NAME -->

            <div class="auth-input-group">
              <label for="regName">
                <i class="fa-solid fa-user"></i>

                Full Name
              </label>

              <input
                type="text"
                id="regName"
                name="name"
                placeholder="Enter your full name"
                autocomplete="name"
                required
              />
            </div>

            <!-- EMAIL -->

            <div class="auth-input-group">
              <label for="regEmail">
                <i class="fa-solid fa-envelope"></i>

                Email Address
              </label>

              <input
                type="email"
                id="regEmail"
                name="email"
                placeholder="Enter your email address"
                autocomplete="email"
                required
              />
            </div>

            <!-- PASSWORD -->

            <div class="auth-input-group">
              <label for="regPassword">
                <i class="fa-solid fa-lock"></i>

                Password
              </label>

              <div class="password-wrapper">
                <input
                  type="password"
                  id="regPassword"
                  name="password"
                  placeholder="Create a strong password"
                  autocomplete="new-password"
                  required
                />

                <button
                  type="button"
                  class="pw-toggle"
                  onclick="togglePw('regPassword', this)"
                  tabindex="-1"
                  aria-label="Show password"
                >
                  <i class="fa-solid fa-eye"></i>
                </button>
              </div>
            </div>

            <!-- ROLE -->

            <div class="auth-input-group">
              <label for="regRole">
                <i class="fa-solid fa-id-badge"></i>

                Select Role
              </label>

              <select id="regRole" name="role" required>
                <option value="">Select Role</option>

                <option value="JOB_SEEKER">Job Seeker</option>

                <option value="RECRUITER">Recruiter</option>
              </select>
            </div>

            <!-- SUBMIT -->

            <input type="submit" value="Create Account" class="register-btn" />
          </form>

          <!-- LOGIN -->

          <div class="auth-switch">
            Already have an account?

            <a href="${pageContext.request.contextPath}/login.jsp">
              Login here
            </a>
          </div>
        </div>
      </div>
    </div>

    <script>
      function togglePw(id, btn) {
        const input = document.getElementById(id);

        const icon = btn.querySelector("i");

        if (input.type === "password") {
          input.type = "text";

          icon.className = "fa-solid fa-eye-slash";

          btn.setAttribute("aria-label", "Hide password");
        } else {
          input.type = "password";

          icon.className = "fa-solid fa-eye";

          btn.setAttribute("aria-label", "Show password");
        }
      }
    </script>
  </body>
</html>
