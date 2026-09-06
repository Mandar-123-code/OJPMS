<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Recruiter Profile | SMARTHIRE</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/editrecruiterprofile.css">
</head>
<body>

<div class="sidebar">
  <div class="sidebar-logo">
    <div class="sidebar-logo-icon"><i class="fa-solid fa-briefcase"></i></div>
    <div class="sidebar-logo-text"><h2>SMARTHIRE</h2><span>Recruiter Portal</span></div>
  </div>
  <nav class="sidebar-nav">
    <a href="recruiter-dashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="#" class="active"><i class="fa-solid fa-user-pen"></i> Edit Profile</a>
    <a href="viewjobs"><i class="fa-solid fa-list-ul"></i> My Jobs</a>
    <a href="home.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <div class="nav-divider"></div>
    <a href="logout" class="logout-link"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
  </nav>
</div>

<div class="main-content">
  <div class="topbar">
    <div class="topbar-left">
      <h1>Edit Profile</h1>
    </div>
    <div class="topbar-right">
      <a href="recruiterprofile.jsp" class="btn btn-secondary btn-sm"><i class="fa-solid fa-arrow-left"></i> Back</a>
    </div>
  </div>

  <!-- HEADER CARD -->
  <div class="erp-header-card">
    <div>
      <h2 class="erp-title"><i class="fa-solid fa-user-pen"></i> Edit Recruiter Profile</h2>
      <p class="erp-subtitle">Update your recruiter account information.</p>
    </div>
  </div>

  <!-- CONTENT -->
  <div class="erp-content">

    <!-- LEFT: PROFILE CARD -->
    <div class="erp-profile-card">
      <div class="erp-avatar">${user.name.substring(0,1)}</div>
      <h2>${user.name}</h2>
      <p class="erp-role">${user.role}</p>
      <span class="erp-tip">Keep your profile information updated to maintain credibility.</span>
    </div>

    <!-- RIGHT: FORM CARD -->
    <div class="erp-form-card">
      <h3 class="erp-form-title"><i class="fa-solid fa-user-tie"></i> Recruiter Information</h3>

      <form action="editrecruiterprofiles" method="post">

        <div class="form-group">
          <label for="erpId">User ID</label>
          <input type="number" id="erpId" name="id" value="${user.id}" readonly>
        </div>

        <div class="form-group">
          <label for="erpName">Full Name</label>
          <input type="text" id="erpName" name="name" value="${user.name}" placeholder="Enter your name">
        </div>

        <div class="form-group">
          <label for="erpEmail">Email Address</label>
          <input type="email" id="erpEmail" name="email" value="${user.email}" placeholder="Enter email">
        </div>

        <div class="form-group">
          <label for="erpPassword">Password</label>
          <div style="position:relative;">
            <input type="password" id="erpPassword" name="password" value="${user.password}" style="padding-right:44px;">
            <button type="button" onclick="toggleErpPw()" tabindex="-1"
              style="position:absolute;right:12px;top:50%;transform:translateY(-50%);background:none;border:none;color:#999;cursor:pointer;">
              <i class="fa-solid fa-eye" id="erpEyeIcon"></i>
            </button>
          </div>
        </div>

        <div class="form-group">
          <label for="erpRole">Role</label>
          <input type="text" id="erpRole" name="role" value="${user.role}" placeholder="Role">
        </div>

        <button type="submit" class="erp-update-btn">
          <i class="fa-solid fa-floppy-disk"></i> Update Profile
        </button>

      </form>
    </div>

  </div>
</div>

<script>
function toggleErpPw() {
  const input = document.getElementById('erpPassword');
  const icon  = document.getElementById('erpEyeIcon');
  if (input.type === 'password') {
    input.type = 'text'; icon.className = 'fa-solid fa-eye-slash';
  } else {
    input.type = 'password'; icon.className = 'fa-solid fa-eye';
  }
}
</script>
</body>
</html>