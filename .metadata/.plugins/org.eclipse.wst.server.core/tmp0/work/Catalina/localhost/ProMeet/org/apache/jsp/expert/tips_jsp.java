/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.64
 * Generated at: 2025-04-13 07:02:13 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.expert;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import promeet_web.dao.*;
import promeet_web.beans.*;
import ProMeet.utilities.*;

public final class tips_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/expert/expert_header.html", Long.valueOf(1744224384113L));
    _jspx_dependants.put("/WEB-INF/common/footer.html", Long.valueOf(1742493861481L));
    _jspx_dependants.put("/common_html/all_css.html", Long.valueOf(1742493036175L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("promeet_web.beans");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("ProMeet.utilities");
    _jspx_imports_packages.add("promeet_web.dao");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <title>Expert Tips</title>\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css\" integrity=\"sha512-q3eWabyZPc1XTCmF+8/LuE1ozpg5xxn7iO89yfSOd5/oKvyqLngoNGsx8jq92Y8eXJ/IRxQbEC+FGSYxtk2oiw==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"icon\" href=\"/ProMeet/images/promeet1.jpg\" class=\"rounded-circle\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/ProMeet/css/style.css\">");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <style>\r\n");
      out.write("        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');\r\n");
      out.write("\r\n");
      out.write("        * {\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            box-sizing: border-box;\r\n");
      out.write("            font-family: 'Poppins', sans-serif;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Page Background */\r\n");
      out.write("        body {\r\n");
      out.write("            background: linear-gradient(135deg, #141E30, #243B55);\r\n");
      out.write("            color: white;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            flex-direction: column;\r\n");
      out.write("            align-items: center;\r\n");
      out.write("            justify-content: center;\r\n");
      out.write("            min-height: 100vh;\r\n");
      out.write("            padding: 20px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Main Form Container */\r\n");
      out.write("        .form-container {\r\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\r\n");
      out.write("            backdrop-filter: blur(10px);\r\n");
      out.write("            padding: 30px;\r\n");
      out.write("            border-radius: 15px;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            max-width: 500px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            box-shadow: 0 5px 20px rgba(255, 255, 255, 0.2);\r\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.3);\r\n");
      out.write("            transition: transform 0.3s ease-in-out;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Hover effect */\r\n");
      out.write("        .form-container:hover {\r\n");
      out.write("            transform: scale(1.03);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Title Styling */\r\n");
      out.write("        .form-container h2 {\r\n");
      out.write("            font-size: 24px;\r\n");
      out.write("            margin-bottom: 20px;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            color: #fff;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Textarea */\r\n");
      out.write("        textarea {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            height: 150px;\r\n");
      out.write("            border-radius: 10px;\r\n");
      out.write("            border: none;\r\n");
      out.write("            padding: 15px;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            background: rgba(255, 255, 255, 0.2);\r\n");
      out.write("            color: white;\r\n");
      out.write("            outline: none;\r\n");
      out.write("            transition: 0.3s;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Placeholder Color */\r\n");
      out.write("        textarea::placeholder {\r\n");
      out.write("            color: rgba(255, 255, 255, 0.7);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Focus Effect */\r\n");
      out.write("        textarea:focus {\r\n");
      out.write("            box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.3);\r\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.5);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Submit Button */\r\n");
      out.write("        .submit-btn {\r\n");
      out.write("            background: linear-gradient(45deg, #ff416c, #ff4b2b);\r\n");
      out.write("            border: none;\r\n");
      out.write("            padding: 12px;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            color: white;\r\n");
      out.write("            border-radius: 25px;\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            transition: 0.3s ease-in-out;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .submit-btn:hover {\r\n");
      out.write("            background: linear-gradient(45deg, #ff4b2b, #ff416c);\r\n");
      out.write("            box-shadow: 0px 5px 15px rgba(255, 75, 43, 0.4);\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Alert Box */\r\n");
      out.write("        .alert {\r\n");
      out.write("            margin-bottom: 15px;\r\n");
      out.write("            color: white;\r\n");
      out.write("            background: rgba(255, 255, 255, 0.2);\r\n");
      out.write("            border: 1px solid rgba(255, 255, 255, 0.3);\r\n");
      out.write("            padding: 10px;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Sticky Footer */\r\n");
      out.write("        footer {\r\n");
      out.write("            width: 100%;\r\n");
      out.write("            background: rgba(255, 255, 255, 0.1);\r\n");
      out.write("            color: white;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("            padding: 10px 0;\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            bottom: 0;\r\n");
      out.write("            left: 0;\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        /* Responsive Design */\r\n");
      out.write("        @media (max-width: 600px) {\r\n");
      out.write("            .form-container {\r\n");
      out.write("                padding: 20px;\r\n");
      out.write("            }\r\n");
      out.write("            .form-container h2 {\r\n");
      out.write("                font-size: 20px;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("    </style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");

    String email = (String) session.getAttribute("sessionEmail");
    if (email == null || session.isNew()) {
        request.setAttribute("message", CustomMessages.AUTHORISE_ERROR);
        RequestDispatcher rd = request.getRequestDispatcher("/expert/expert_login.jsp");
        rd.forward(request, response);
    }
    else{
    	ExpertDao dao=new ExpertDao();
    	Expert e=dao.expertProfile(email);
    	String uploadPath=request.getContextPath();
    	System.out.println("path is" +uploadPath);
    	String imagePath=uploadPath+"/"+e.getProfile_pic();
    	System.out.println("Actual Image Path is " +imagePath);
    	String docPath=uploadPath+"/"+e.getVerification_document();
    	System.out.println("Actual Document Path is " + docPath);
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- Bootstrap CSS -->\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<!-- Font Awesome -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\" />\r\n");
      out.write("\r\n");
      out.write("<!-- Google Font (Poppins) -->\r\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("  body {\r\n");
      out.write("    font-family: 'Poppins', sans-serif;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  .offcanvas-header {\r\n");
      out.write("    background: linear-gradient(135deg, #1e3c72, #2a5298);\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  .nav-link {\r\n");
      out.write("    transition: 0.3s;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  .nav-link:hover {\r\n");
      out.write("    background-color: rgba(255, 255, 255, 0.1);\r\n");
      out.write("    border-radius: 5px;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  .nav-link i {\r\n");
      out.write("    width: 25px;\r\n");
      out.write("  }\r\n");
      out.write("\r\n");
      out.write("  .navbar-dark .navbar-toggler {\r\n");
      out.write("    border: none;\r\n");
      out.write("  }\r\n");
      out.write("</style>\r\n");
      out.write("<nav class=\"navbar navbar-dark bg-dark fixed-top shadow\">\r\n");
      out.write("  <div class=\"container-fluid\">\r\n");
      out.write("    <!-- Toggler -->\r\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"offcanvas\"\r\n");
      out.write("      data-bs-target=\"#offcanvasDarkNavbar\" aria-controls=\"offcanvasDarkNavbar\">\r\n");
      out.write("      <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("    </button>\r\n");
      out.write("\r\n");
      out.write("    <!-- Offcanvas Menu -->\r\n");
      out.write("    <div class=\"offcanvas offcanvas-start text-bg-dark\" tabindex=\"-1\" id=\"offcanvasDarkNavbar\"\r\n");
      out.write("      aria-labelledby=\"offcanvasDarkNavbarLabel\">\r\n");
      out.write("\r\n");
      out.write("      <!-- Header with Avatar -->\r\n");
      out.write("      <div class=\"offcanvas-header\">\r\n");
      out.write("        <div class=\"d-flex align-items-center\">\r\n");
      out.write("          <img src=\"/ProMeet/images/d.jpg\" class=\"rounded-circle me-2\" width=\"40\" height=\"40\" alt=\"avatar\">\r\n");
      out.write("          <h5 class=\"mb-0 text-white\">Hello <b>Expert</b></h5>\r\n");
      out.write("        </div>\r\n");
      out.write("        <button type=\"button\" class=\"btn-close btn-close-white\" data-bs-dismiss=\"offcanvas\"\r\n");
      out.write("          aria-label=\"Close\"></button>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <!-- Menu Items -->\r\n");
      out.write("      <div class=\"offcanvas-body\">\r\n");
      out.write("        <ul class=\"navbar-nav\">\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a class=\"nav-link text-white\" href=\"/ProMeet/expert/expert_home.jsp\">\r\n");
      out.write("              <i class=\"fas fa-home\"></i> Home\r\n");
      out.write("            </a>\r\n");
      out.write("          </li>\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a class=\"nav-link text-white\" href=\"/ProMeet/expert/expert_EditProfile.jsp\">\r\n");
      out.write("              <i class=\"fas fa-user-edit\"></i> Edit Profile\r\n");
      out.write("            </a>\r\n");
      out.write("          </li>\r\n");
      out.write("         \r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a class=\"nav-link text-white\" href=\"/ProMeet/expert/tips.jsp\">\r\n");
      out.write("              <i class=\"fas fa-lightbulb\"></i> Add Tips\r\n");
      out.write("            </a>\r\n");
      out.write("          </li>\r\n");
      out.write("\r\n");
      out.write("          <!-- Dropdown Menu -->\r\n");
      out.write("          <li class=\"nav-item dropdown\">\r\n");
      out.write("            <a class=\"nav-link dropdown-toggle text-white\" href=\"#\" role=\"button\"\r\n");
      out.write("              data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\r\n");
      out.write("              <i class=\"fas fa-calendar-check\"></i> View Booking\r\n");
      out.write("            </a>\r\n");
      out.write("            <ul class=\"dropdown-menu dropdown-menu-dark\">\r\n");
      out.write("              <li><a class=\"dropdown-item\" href=\"/ProMeet/expert/pending_request.jsp\">Pending</a></li>\r\n");
      out.write("              <li><a class=\"dropdown-item\" href=\"/ProMeet/expert/confirm_request.jsp\">Confirm</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </li>\r\n");
      out.write("\r\n");
      out.write("          <li class=\"nav-item\">\r\n");
      out.write("            <a class=\"nav-link text-danger fw-semibold\" href=\"/ProMeet/ExpertLogout\">\r\n");
      out.write("              <i class=\"fas fa-sign-out-alt\"></i> Logout\r\n");
      out.write("            </a>\r\n");
      out.write("          </li>\r\n");
      out.write("        </ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- Expert Tips Form -->\r\n");
      out.write("<div class=\"form-container\">\r\n");
      out.write("    <h2>💡 Share Your Expert Tips</h2>\r\n");
      out.write("\r\n");
      out.write("    ");
 String mess = (String) request.getAttribute("message");
        if (mess != null) { 
      out.write("\r\n");
      out.write("        <div class=\"alert alert-dismissible fade show\" role=\"alert\">\r\n");
      out.write("            ");
      out.print( mess );
      out.write("\r\n");
      out.write("            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button>\r\n");
      out.write("        </div>\r\n");
      out.write("    ");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <form action=\"/ProMeet/AddTips\" method=\"post\" novalidate class=\"needs-validation\">\r\n");
      out.write("        <div class=\"mb-3\">\r\n");
      out.write("            <textarea placeholder=\"Enter your expert advice here...\" name=\"content\" required></textarea>\r\n");
      out.write("        </div>\r\n");
      out.write("        <button type=\"submit\" class=\"submit-btn\">📩 Submit Tip</button>\r\n");
      out.write("    </form>\r\n");
      out.write("</div>\r\n");
} 
      out.write("\r\n");
      out.write("<br><br><br><br>\r\n");
      out.write("<!-- Footer -->\r\n");
      out.write("<footer class=\" text-center\" style=\"background-color: cyan\">\r\n");
      out.write("  <!-- Grid container -->\r\n");
      out.write("  <div class=\"container p-4 pb-0\">\r\n");
      out.write("    <!-- Section: Social media -->\r\n");
      out.write("    <section class=\"mb-4\">\r\n");
      out.write("      <!-- Facebook -->\r\n");
      out.write("      <a\r\n");
      out.write("      data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #3b5998;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-facebook-f\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Twitter -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #55acee;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-twitter\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Google -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #dd4b39;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-google\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Instagram -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #ac2bac;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-instagram\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("\r\n");
      out.write("      <!-- Linkedin -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #0082ca;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-linkedin-in\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("      <!-- Github -->\r\n");
      out.write("      <a\r\n");
      out.write("        data-mdb-ripple-init\r\n");
      out.write("        class=\"btn text-white btn-floating m-1\"\r\n");
      out.write("        style=\"background-color: #333333;\"\r\n");
      out.write("        href=\"#!\"\r\n");
      out.write("        role=\"button\"\r\n");
      out.write("        ><i class=\"fab fa-github\"></i\r\n");
      out.write("      ></a>\r\n");
      out.write("    </section>\r\n");
      out.write("    <!-- Section: Social media -->\r\n");
      out.write("  </div>\r\n");
      out.write("  <!-- Grid container -->\r\n");
      out.write("\r\n");
      out.write("  <!-- Copyright -->\r\n");
      out.write("  <div class=\"text-center p-3\" style=\"background-color: rgb(0, 0, 64); color:red;\">\r\n");
      out.write("    Â© 2025 Copyright Created By Prince\r\n");
      out.write("    \r\n");
      out.write("  </div>\r\n");
      out.write("  <!-- Copyright -->\r\n");
      out.write("</footer>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"/ProMeet/js/validation.js\"></script>\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
