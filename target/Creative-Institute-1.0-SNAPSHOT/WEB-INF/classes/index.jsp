<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">


<head>

  <!-- Meta -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1">

  <!-- Title -->
  <title>Creative Education</title>

  <!-- Favicon -->
  <link href="MainPage/images/favicon.ico" rel="icon" type="image/x-icon" />

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet" />
  <link href="MainPage/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

  <!-- Mobile Menu -->
  <link href="MainPage/css/mmenu.css" rel="stylesheet" type="text/css" />
  <link href="MainPage/css/mmenu.positioning.css" rel="stylesheet" type="text/css" />

  <!-- Stylesheet -->
  <link href="MainPage/style.css" rel="stylesheet" type="text/css" />

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="MainPage/js/html5shiv.min.js"></script>-->
<!--  <script src="MainPage/js/respond.min.js"></script>-->

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jost&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Sinhala:wght@300&display=swap" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gemunu+Libre:wght@700&display=swap" rel="stylesheet">
  <style>
    h3{
      font-family: 'Noto Sans Sinhala', sans-serif;
      margin: unset;
    }
    p{
      font-family: 'Noto Sans Sinhala', sans-serif;
      margin: unset;
    }

    .navbar-wrapper.scrolled {
      background-color: rgb(193 118 255) !important ;
      transition: background-color 200ms linear;
    }


    /* carousel */
    #quote-carousel {
      padding: 0 10px 30px 10px;
      margin-top: 30px;
      text-align:center;
    }
    /* indicator position */
    #quote-carousel .carousel-indicators {
      right: 50%;
      top: auto;
      bottom: -10px;
      margin-right: -19px;
      color:#60dfe5;
    }
    /* indicator color */
    #quote-carousel .carousel-indicators li {
      background: #333333;
      height:4px;
      width:50px;
    }
    /* active indicator */
    #quote-carousel .carousel-indicators .active {
      background: #60dfe5;
      height:4px;
      width:50px;
      margin-bottom:1px;
    }
  </style>
</head>

<body class="layout-v3">

<!-- Start: Header Section -->
<header id="header" class="navbar-wrapper">
  <div class="container-fluid">
    <div class="row">
      <nav class="navbar navbar-default">
        <div class="menu-wrap">
          <div class="navbar-header">
            <div class="navbar-brand">
              <h1>
                <a href="index.jsp">
                  <img src="MainPage/images/logo.png" alt="TR Education"  style="max-width: 77%;"/>

                </a>
              </h1>
            </div>
          </div>
          <!-- Navigation -->
          <div class="navbar-collapse hidden-sm hidden-xs">
            <ul class="nav navbar-nav">
              <li class="dropdown active">
                <a data-toggle="dropdown" class="dropdown-toggle disabled" href="#home-v1-header-carousel">Home</a>

              </li>
              <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle disabled" href="#ELearning">E-Learning</a>

              </li>
              <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle disabled" href="#AboutUs">About Us</a>

              </li>
              <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle disabled" href="#ContactUs">Contact Us</a>

              </li>

              <!-- <li class="dropdown">
                  <a data-toggle="dropdown" class="dropdown-toggle disabled" href="blog.html">Blog</a>

              </li>
              <li><a href="services.html">Services</a></li>
              <li><a href="contact.html">Contact</a></li> -->
            </ul>
            <!-- Header Topbar -->
            <div class="header-topbar hidden-md">
              <div class="topbar-links">
                <a href="login.jsp"><i class="fa fa-lock"></i>Login / Register</a>
              </div>
            </div>
            <!-- Header Topbar -->
          </div>
          <div class="header-socialbar hidden-sm hidden-xs">
            <ul class="social-links">
              <li><a href=""><i class="fa fa-facebook"></i></a></li>
              <li><a href=""><i class="fa fa-youtube"></i></a></li>
              <li><a href=""><i class="fa fa-instagram"></i></a></li>
              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            </ul>
            <ul class="share-links">
              <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                  <i class="fa fa-share"></i>
                </a>
                <div class="dropdown-menu social-dropdown">
                  <ul>
                    <li><a href=""><i class="fa fa-facebook"></i></a></li>
                    <li><a href=""><i class="fa fa-youtube"></i></a></li>
                    <li><a href=""><i class="fa fa-instagram"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <!-- <li><a href="#"><i class="fa fa-rss"></i></a></li> -->
                  </ul>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="mobile-menu hidden-md hidden-lg">
          <a href="#mobile-menu"><i class="fa fa-navicon"></i></a>
          <div id="mobile-menu">
            <ul>
              <li class="mobile-title">
                <h4>Navigation</h4>
                <a href="#" class="close"></a>
              </li>
              <li>
                <a href="#home-v1-header-carousel">Home</a>

              </li>
              <li>
                <a  href="#ELearning">E-Learning</a>

              </li>
              <li>
                <a href="#AboutUs">About Us</a>

              </li>
              <li>
                <a href="#ContactUs">Contact Us</a>

              </li>
              <li>
                <a href="login.jsp">Login</a>

              </li>
              <li>
                <a href="login.jsp">Register</a>

              </li>

            </ul>
          </div>
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- End: Header Section -->

<!-- Start: Slider Section -->
<div data-ride="carousel" class="carousel slide" id="home-v1-header-carousel" >
  <!-- Carousel slides -->
  <div class="carousel-inner">
    <div class="item active">
      <figure class="hidden-md hidden-lg">
        <img alt="Home Slide" src="MainPage/images/DF_Mob.jpg" />
      </figure>
      <figure class="hidden-sm hidden-xs">
        <img alt="Home Slide" src="MainPage/images/DF.png" />
      </figure>
      <div class="container">
        <div class="carousel-caption hidden-sm hidden-xs" style="text-align: left;">
<%--          <img src="MainPage/images/jhon.png" style="max-width: 28%;">--%>
          <!-- <h2 style="margin-bottom: unset;font-family: 'Gemunu Libre', sans-serif;">තිසර රංජිව</h2> -->
          <p style="font-family: 'Noto Sans Sinhala', sans-serif; margin: unset;">නිර්මාණශීලී ගණිත පරපුරක් උදෙසා</p>
          <div class="filter-box" style="margin: unset;">
            <form action="login.jsp" class="banner-filter-box" method="get">


              <form class="form-group-row">
                <div class="col-lg-12" style="padding: unset; padding-top: 30px;">
                  <input class="form-control" type="submit" value="Let's Start" style="border-radius: 25px; margin: unset; ">
                </div>
                <!-- <div class="col-lg-6 ">
                    <input class="form-control" type="submit" value="Let's Start" style="border-radius: 25px; ">
                </div> -->
              </form>

            </form>
          </div>
        </div>
        <div class="carousel-caption hidden-md hidden-lg" style="text-align: center; top:154px; margin-top: 15px;">
          <img src="MainPage/images/thisara.png" style="max-width: 77%;">
          <p style="font-family: 'Noto Sans Sinhala', sans-serif; margin: unset;">නිර්මාණශීලී ගණිත පරපුරක් උදෙසා</p>
          <div class="filter-box" style="margin: unset;">
            <form action="login.jsp" class="banner-filter-box" method="get" style="text-align: -webkit-center;">


              <form class="form-group-row">
                <div class="col-lg-12" style="padding: unset; padding-top: 30px; bottom: -84px;">
                  <input class="form-control" type="submit" value="Let's Start" style="border-radius: 25px; margin: unset; background-color: #288feb66;    border: 2px solid #ffffff; ">
                </div>
                <!-- <div class="col-lg-6 ">
                    <input class="form-control" type="submit" value="Let's Start" style="border-radius: 25px; ">
                </div> -->
              </form>

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</section>
<section class="welcome-section" id="AboutUs">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="welcome-wrap" style="padding-bottom: unset; ">
          <div class="welcome-text" >
            <h2 class="section-title" style="font-family: 'Noto Sans Sinhala', sans-serif;font-weight: bold;">ආයුබෝවන්!</h2>
            <span class="underline left"></span>
            <p style="font-family: 'Noto Sans Sinhala', sans-serif;">පසුගිය වසර කිහිපය ඇතුලත ගණිතය විෂය සදහා අති විශිෂ්ටතම ප්‍රතිඵල බිහිකළ නිර්මාණශීලී ගුරුවරයකි. සාමාන්‍ය පෙළ සහ පාසල් වාර විභාගයන්වල ඉහලම ප්‍රතිඵල අතරට සෑම වර්ෂයකම අපගේ දරුවන් වෙති.
              දරුවන් සදහා වැඩිම විභාග සහ වැඩිම ප්‍රශ්න ප්‍රමාණයක් සාකච්ඡා කරවන අපගේ පන්ති තුලින් ඉතාමත් පහල මට්ටමේ දරුවෙකු වුවද ඉතාමත් ඉහල ප්‍රතිඵල කරා ගෙනෙනු ලබයි.
              සිවිල් ඉංජිනේරු ඩිප්ලෝමා ධාරියෙක්වන, වසර 7කට වඩා උපකාර පන්ති ක්ෂේත්‍රයේ අත්දැකීම් ඇති ප්‍රදේශයේ විශිෂ්ටතම ගණිතය ගුරුවරයෙකි.</p>
            <a class="btn btn-primary" href="#">Read More</a>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="welcome-image" style="padding-top: 35px;">
          <img src="MainPage/images/class/Thisar_pic_.png" class="algin-right" alt="">
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Start: Category Filter -->
<section class="category-filter section-padding">
  <div class="container">
    <div class="center-content" style="margin-bottom: 13px;">
      <h2 class="section-title">Check Out Our Classes</h2>
      <span class="underline center"></span>

    </div>
    <div class="filter-buttons">
      <div class="filter btn" data-filter="all">All Classes</div>
      <div class="filter btn" data-filter=".Grade6">Grade 6</div>
      <div class="filter btn" data-filter=".Grade7">Grade 7</div>
      <div class="filter btn" data-filter=".Grade8">Grade 8</div>
      <div class="filter btn" data-filter=".Grade9">Grade 9</div>
      <div class="filter btn" data-filter=".Grade10">Grade 10</div>
      <div class="filter btn" data-filter=".Grade11">Grade 11</div>
    </div>
  </div>
  <div id="category-filter">
    <ul class="category-list">
      <li class="category-item Grade6">
        <figure>
          <img src="MainPage/images/class/1.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 6</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>GREEN WAY BADDEGAMA</strong></span>
              <p>Thursday 2:30 PM - 4:30 PM</p>
              <a href="#">Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade7">
        <figure>
          <img src="MainPage/images/class/2.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 7</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>GREEN WAY BADDEGAMA</strong></span>
              <p>Saturday 1:30 PM - 3:30 PM</p>
              <a href="#">Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade7">
        <figure>
          <img src="MainPage/images/class/3.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 7</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>SISARA BATAPOLA</strong></span>
              <p>Wednesday 3:30 PM - 5:30 PM</p>
              <a href="#">Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade8">
        <figure>
          <img src="MainPage/images/class/4.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 8</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>GREEN WAY BADDEGAMA</strong></span>
              <p>Saturday 3:30 PM - 5:30 PM</p>
              <a href="#" >Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade8">
        <figure>
          <img src="MainPage/images/class/5.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 8</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>SISARA BATAPOLA</strong></span>
              <p>Friday 5:30 PM - 7:30 PM</p>
              <a href="#" >Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade9">
        <figure>
          <img src="MainPage/images/class/6.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 9</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>GREEN WAY BADDEGAMA</strong></span>
              <p>Monday 5:30 PM - 7:30 PM</p>
              <a href="#" >Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade10">
        <figure>
          <img src="MainPage/images/class/7.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 10</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>GREEN WAY BADDEGAMA</strong></span>
              <p>Saturday 10:00 PM - 12:30 PM</p>
              <a href="#" >Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade10">
        <figure>
          <img src="MainPage/images/class/8.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 10</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>SISARA BATAPOLA</strong></span>
              <p>Sunday 04:00 PM - 06:30 PM</p>
              <a href="#" >Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade11">
        <figure>
          <img src="MainPage/images/class/9.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 11</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>GREEN WAY BADDEGAMA</strong></span>
              <p>Saturday 07:30 PM - 10:00 PM</p>
              <a href="#" >Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
      <li class="category-item Grade11">
        <figure>
          <img src="MainPage/images/class/3.jpg" alt="New Releaase" />
          <figcaption class="bg-blue">
            <div class="info-block" style="font-size: 22px;">
              <h4 style="font-size: 30px;">GRADE 11</h4>

              <span class="author" style="font-family: 'Jost', sans-serif;"><strong>SISARA BATAPOLA</strong></span>
              <p>Sunday 01:30 PM - 04:00 PM</p>
              <a href="#" >Join <i class="fa fa-long-arrow-right"></i></a>

            </div>
          </figcaption>
        </figure>
      </li>
    </ul>
    <div class="clearfix"></div>

  </div>

</section>
<!-- Start: Category Filter -->

<!-- Start: Our Community Section -->
<section class="welcome-section" id="ELearning">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="welcome-wrap" style="padding-bottom: unset;">
          <div class="welcome-text">
            <h2 class="section-title" style="font-family: 'Noto Sans Sinhala', sans-serif;font-weight: bold;">Youtube හරහා එකතුවන්න</h2>
            <span class="underline left"></span>
            <p style="font-family: 'Noto Sans Sinhala', sans-serif;">එකිනෙකට වෙනස් වූ සිසුන්ගේ අදහස් එකම අරමුණක් වෙනුවෙන් සම්බන්ධ කරවන පැහැබර අනාගතයක පැහැදිලි ගමන අතිශයින්ම ජයග්‍රහණය හඹා යන්නන් වූවන් උදෙසාම කැපවුනු සංකීර්ණ විෂය පථයක සරල නිර්මාණශීලී ගුරු චරිතය...</p>
            <a class="btn btn-primary" href="#">Read More</a>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="welcome-wrap" style="padding-top: 35px;">
          <div class="welcome-text" style="width: 100%;">
            <iframe width="100%" height="300px" allowfullscreen="" class="YOUTUBE-iframe-video video-card-top" data-thumbnail-src="https://www.youtube.com/embed/BGYDBIQAON8" frameborder="0" src="https://www.youtube.com/embed/BGYDBIQAON8">
            </iframe>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>





<div class="layout-v2" style="margin-bottom: 3px;">
  <div class="layout-v2-counter">
    <div class="facts-counter">
      <div class="container">

          <ul>
            <li class="col-sm-3 color-light-green" style="margin-right: unset">
              <div class="fact-item">
                <div class="fact-icon">
                  <i class="fa fa-user" aria-hidden="true" style="    font-size: 60px; color: #84bb45;"></i>
                </div>
                <span>Students<strong class="fact-counter">220</strong></span>
              </div>
            </li>
            <li class="col-sm-3 color-green" style="margin-right: unset">
              <div class="fact-item">
                <div class="fact-icon">
                  <i class="fa fa-book" aria-hidden="true" style="    font-size: 60px; color: #43c5b9;"></i>
                </div>
                <span>Classes<strong class="fact-counter">10</strong></span>
              </div>
            </li>
            <li class="col-sm-3 color-red" style="margin-right: unset">
              <div class="fact-item">
                <div class="fact-icon">
                  <i class="fa fa-line-chart" aria-hidden="true" style="    font-size: 60px; color: #ff7236;"></i>
                </div>
                <span>Results<strong ><a class="fact-counter">100</a>%</strong></span>
              </div>
            </li>

            <li class="col-sm-3 color-blue" style="margin-right: unset">
              <div class="fact-item">
                <div class="fact-icon">
                  <i class="fa fa-youtube" aria-hidden="true" style= "font-size: 60px; color: #00adef;"></i>
                </div>
                <span>Videos<strong class="fact-counter">20</strong></span>
              </div>
            </li>
          </ul>
        </div>

    </div>
  </div>
</div>

<section class="category-filter section-padding">
  <div class="center-content">
    <h2 class="section-title" style="font-family: 'Noto Sans Sinhala', sans-serif; margin-bottom: 5px;">අපේ වත්කම්</h2>
    <span class="underline center"></span>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="carousel slide" data-ride="carousel" id="quote-carousel">

          <!-- Bottom Carousel Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
            <li data-target="#quote-carousel" data-slide-to="1"></li>
            <li data-target="#quote-carousel" data-slide-to="2"></li>
          </ol>

          <!-- Carousel Slides / Quotes -->
          <div class="carousel-inner">

            <!-- Quote 1 -->
            <div class="item active">
              <div class="row">
                <div class="col-sm-12">
                  <p  style="font-family: 'Noto Sans Sinhala', sans-serif; margin-bottom: 10px;color: white;">
                    ඇත්තම කිවුවොත් මට කිසිම උනන්දුවක් තිබ්බෙ නෑ සර්ලගෙ වදේට තමයි වැඩ කරෙත් 😐 ඒ උනාට ගනං වලටනම් ආසයි පාඩම් කරන්න නැති නිසා. පන්තියෙදි ලොකුවට හොඳ අහලනම් නෑ ඉතින් ගෙදර වැඩ කරන්නෙත් නෑ වැඩිය. ගුටිකන්න වෙන නිසා ටිකක් කරගෙන යනෝ🙈 කොහොමහරි ගනං වලටනම් A එකක් තීනො 🌝❤️ සර්ගෙ පන්ති ආපු නිසා තමයි ඉතින් A එකක් ගන්න පුලුවන් උනේ. පේපර් ක්ලාස් එකේ අපිට වඩා වැඩුමල් අයගෙ පන්තියට ගිහිල්ලට්ජ් පලවෙනිය දෙවනිය තුන්වෙනිය වෙද්දිනම් පොඩි මෙවුව එකක් ආව🙈 අනිත් පේපර් එකත් හොදට කරන්න ආසාවක් ගැම්මක් වගේ එකක් ✊🏻 පේපර් ක්ලාස් එකනම් ගොඩක් වටිනො ❤️ අනික මං දෙයක් ලේසියෙන් මේක මෙහෙමයි කියල ඔලුවට දාගන්නෑ උගන්නද්දි අනන්තවත් සර්ට වදදීල ඇති එහෙම උනේ කොහොමද කියල. කොහොමහරි සර් හැමෝටම තේරෙනකම් කීපාරක් හරි පාඩම කියල දුන්න 🥰
                  </p>
                  <span style="font-size: 100%;font-family: 'Noto Sans Sinhala', sans-serif; margin-bottom: 5px;color: white;"><strong>ලක්ෂානි මධුවන්ති (2020-O/L)</strong></span>

                </div>
              </div>
            </div>

            <!-- Quote 2 -->
            <div class="item">
              <div class="row">
                <div class="col-sm-12">
                  <p  style="font-family: 'Noto Sans Sinhala', sans-serif;margin-bottom: 10px;color: white;">
                    රිසාර්ට් එක ගැන නම් මාර සතුටුයි සර් මට ගනන් වල සර්ගෙ පන්ති එන්න කලින් තිබ්බෙ ලකුනු 37ක් වගේ මන් ඊට පස්සෙ අම්මලගේ බලකිරීමටම සර්ගෙ පන්ති ආවෙ .මොකද සර් හෙන නපුරුයි කියලා මට ආරංචියක් තිබ්බා 😂 ඉතින් මාර කේන්තියෙන් සහ බයෙන් තමා සර්ගෙ මුල්ම දවසට ආවෙ .මන් මුලින්ම සර්ගෙ පන්ති ආවෙ 8ට වසරෙදි අටේ මැද වගේ . හැබැයි ඒත් අපේ වයසෙ පන්තියකට නෙමෙයි 9වසරෙ පන්තියකට ...මුලින්ම ඉස්සරහ පේලියේ තමා ඇවිත් වාඩි උනේ .එතකොට මට මතකයි සර් ඒ අයගෙන් ප්‍රෂ්නයක් ඇහුවා 12 වර්ගය කීයද කියලා කවුරුත් උත්තර දුන්නැති නිසා මම උත්තර දුන්නා මගේ උත්තරෙ හරි ගියා හැබැයි 😀කනාවට සර් හොදයි කියලා කිව්වාම මාර සතුටක් ආවා මුලින්ම ගනන් ගුරුවරයෙක්ගෙන් හොදයි කියලා අහගත්ත නිසා ..ඊට පසේ සර් අපිටත් පන්ති පටන් ගත්තා පටන් ගෙන ටික දවසක් යනකොට කාඩ් මාක් කරන සර් ඇවිත් අපෙන් ස්කෝලෙ වාරවිබාග වල ගනන් වලට ලකුනු ඇහුවා ..මේ කාලෙනම් පන්තියේ හතරක් හිටියා මාත් එක්කම ..හැබැයි මේ අයට ලකුනු හැත්තෑව වගේ පැනලා තිබ්බෙ මට 37යි මන් ඉතින් සර්ලට ලකුනු හතලිස් ගානක් කිව්වා 😁ඊට පස්සෙ මට අනික් තුන් දෙනා හිනාවෙනවාත් ඇහුනා ඒ වෙලාවෙ සර් මට කිවා හරි අපි ඊලග පාර බලමු නේ පුතේ කියලා ඊට පස්සෙ සර්ගෙ ඒ වචනෙට ගරු කරලා මන් වැඩකරා මට 8අන්තිම වාරෙ ලකුනු 74ක් ද කොහේ ආවා ...ඊට පස්සෙ තවත් මහන්සි උනා 9අන්තිම වාරෙ ලකුනු 99ක් ආවා ඔහොම ගිහින් සර්ගෙ ටෙස්ට් හැම එකටම ලියලා හොද ලකුනු අරගෙන පාස් පේපර් අවුරුදු 11ක වගේ ලරලා ස්කෝලෙ අන්තිම විබාගෙත් ලිව්ව ඒකෙත් ලකුනු 86ක් තිබ්බා ...අද රිසාට් ආවා මට ගනන් වලට Aඑකක් .මන් දන්නවා A එකක් ගන්න හැමෝටම පුලුවන් ඒ ඒ අයගේ සහජ හැකියාව හැබැයි මම පහලම තැනක ඉදලයි A එකක් ගත්තේ ඒ සර්ගෙ ආකර්ෂනීය නිර්මානෂීලී ඉගැන්වීම නිසා මන් හිතන්නෙ සර් මාර ප්‍රසිද්දයි වැඩ බැරි අයට උගන්නන්න ඒක මගේ යාලුවොන් ගෙ රිසර්ට් වලිනුත් පේනවා සර්ට පින්සිද්ද වෙන්න ගනන් වලට A එකක් ආවා ගොඩාක් ස්තූතියි සර් අපිට ඒ ඉගැන්නුව විදියට හැම විෂය කොටසක්ම උගන්නලා ඒත් මදීයි කියලා හිතලා පේපර් පනහක් වගේත් ලියවලයි සර් අපිව විබාගෙට ඇරියෙ ....Tnx Sir ❤❤  සර්ට බුදු සරනයි
                  </p>
                  <span style="font-size: 100%;font-family: 'Noto Sans Sinhala', sans-serif; margin-bottom: 5px;color: white;"><strong>චමිත් ඉසන්ක (2020-O/L)</strong></span>

                </div>
              </div>
            </div>

            <!-- Quote 3 -->
            <div class="item">
              <div class="row">
                <div class="col-sm-12">
                  <p  style="font-family: 'Noto Sans Sinhala', sans-serif;margin-bottom: 10px;color: white;">
                    මම සර්ගේ ගණිතය පන්තියට සහභාගී උනේ 11 වසරෙදි. ඒ වෙනකොට මට තිබුනෙ ගණිතය විෂයට 37 ක ලකුණු සංඛ්‍යාවක් 😔. නමුත් මට අවුරුද්දක වැනි කෙටි කාලයක් තුළදී ලැබුණු හොඳම දේ තමයි අච්චර අඩු ලකුණු සංඛ්‍යාවක් තිබිලත් O/L විභාගයට ගණිතය විෂයට B සාමාර්ථයක් ලබා ගැනීමට හැකි වීමයි😊. මෙකට හේතුව තමයි sir ගෙ දක්ෂතාවය🙏. Sir ලමයින් වෙනුවෙන් කැපවීමෙන් කටයුතු කලා. මට ඒ කැපවීම ගැන කියන්න වචන නෑ🙏මොකද මම විද්‍යාව විෂයට  ගිය පංතිය O/L වලට මාස 1 කලින් නැවැත්තුවා. 😟. නමුත් සර් O/L  ගණිතය විෂයට කලින් දවසේදී ත් කිව්වෙ පුතේ හොදින් ලියන්න කියලා!😊😊. විභාගය අවසානය දක්වා ම සර් අපි වෙනුවෙන් කල අවංක  කැපවීමට මගේ හෘදයාංගම ස්තුතිය පුද කර සිටිමි. 🙏🙏🙏😊.
                  </p>
                  <span style="font-size: 100%;font-family: 'Noto Sans Sinhala', sans-serif; margin-bottom: 5px;color: white;"><strong>සවිනි දෙවින්දි (2020-O/L)</strong></span>

                </div>
              </div>
            </div>
            <div class="item">
              <div class="row">
                <div class="col-sm-12">
                  <p  style="font-family: 'Noto Sans Sinhala', sans-serif;margin-bottom: 10px;color: white;">
                    සරල මිනිස්සු හැමදාමත් දිනුවෙ කැපවීමෙන් අපිත් සරලයි සර්ගෙත් ලොකු කම් නැ සරලයි අද ඒවල.ප්‍රතිප්‍රල තියේ X,Y වල.අගේ හොයන්න කියල දිල A සාමාර්තයේ වටිනාකම.කියල දුන්නෙ සර්. අද A එකක් ගත්තනම් ගත්තෙ සර් නිසා  කිසිම.ලොකු කමක් නැ කේන්ති ගියාට ටිකක් කේන්ති ගන්න අමාරුයි සර්ට ඒක සර්ට පුරුදු නැ උබල ,බොල, බන් කියාගෙන පන්තියේ ඉගැන්නුවෙ හොදටම දැනෙන්න අන්තිම.වෙද්දි ලකුනු 80 ගනන් වලට ලකුනු එද්දි ගනන් වලට අපට වඩා සර් සතුටු උනා. කවදාවක් ගානක් ඇහුවහම මන් දැන් වැඩක් පස්සෙ හදල.දාන්නම්.කියල නැ පාරෙද ඉන්නෙ ඒත් ගාන කියල දීල.තියේ. සීමා නැතුව වටේ යන්න වෙද්දි අසාවෙන් නැවතිලා ඉගෙන ගන්න හිතුන එකම තැන සර්ගෙ පන්තිය සර්ගෙ නෙමේ අපි හිටියෙ එක පවුලක් වගේ තරගෙ තිබ්බෙ නැ ඇදගෙන යන්නයි බැල්වෙ ඔක්කෝම. දැනෙන්න හරියටම ගනන් කියල දීල A එකක් ගන්න උදවු කරපු සර්ට බුදු සරණයි 🙏❤️ එදා පාටිය නොදුන්න එකට දැනම් සතුටුයි එදාට වඩා දෙයක්  දැන් හම්බෙනව සර්ගෙ රිසාල්ට් හොදයිටම හොදයි අනිවා සතුටින් ඇත්තෙ 👻🙈😇
                  </p>
                  <span style="font-size: 100%;font-family: 'Noto Sans Sinhala', sans-serif; margin-bottom: 5px;color: white;"><strong>විමාශ් මිහිරාන් (2020-O/L)</strong></span>

                </div>
              </div>
            </div>

            <div class="item">
              <div class="row">
                <div class="col-sm-12">
                  <p  style="font-family: 'Noto Sans Sinhala', sans-serif;margin-bottom: 10px;color: white;">
                    හායිහ් සර්😊ආයුශ බොහෝ වේවා! අපි නම් ඕලෙවෙල් ලියන්නේ එක අවුරුද්දයිනේ ඒත් සර් හැම අවුරුද්දෙම ලියනෝ නේ 😹 මතකද ඉස්සෙල්ලම පන්තියට ආපු දවස් වල හිටපු අර පඩත්තල එකාව😹.......... අම්මෝ ඒ පන්තිවල නම් අමතක නොවන මතක ගොඩක් ඇති..... තාමත් ඇති ජෝකර් කෙනෙක්ගේ ලොකුවට මූණක් ඇදපු වාඩිවෙන බංකුවක් ඇහ් ඒක මන් ඇන්දේ  හී😁....... ඒ දවස්වල ඉදන්ම පන්ති ආවම මන් හිටියේ පන්තියේ නෙවේ නේ සර්...... එක්කෝ පිටිපස්සෙම එකේ ඉදන් කයිය ගහනෝ, නැත්නම් මනෝලෝකේ,.... නැත්නම් වතුර බොන්න යනෝ 😹 මතකද එපාර එක දිගටම ඉස්සරහම බංකුවේ හිටියා 🤕 හිටිය නෙවේ මාව ඒකේ හිටෙව්වා 😖 සර් එදා ඒම නොකරනම් මට අද B එකක්වත් නෑනේ 🥺 සර් නිසා තමයි ඉතින්, දන්න එවුන් දන්නෝ ඉතින් තාත්තෙක් වගේ, අයියෙක් වගේ ඕන ප්‍රශ්නයක් කිව්වම ඒකට මොකක් හරිම විසදුමක් හොයල දුන්නා...... ගොඩක් පින් සර් ඒවට 🙏❤ ඒ කරපු උදව් නම් තීන්න ඕන උපරිම තැන හැමදාම තීනෝ❤
                    එකෙක්වත් හලල ගියේ නෑනේ සර් ඇහ්..... ගානක් හැදුව උනත් ලගට ඇවිල්ලා අහනො ඔයා හැදුවද ඔයා හැදුවද කිය කිය ඒදවස් වල නම් පට්ට ඇණේ 😹හැබැයි අඇන් තමයි තේරෙන්නේ ඒ ඇනේ එදා තිබ්බේ නැත්නම් මේ joint එක හරියට හිටින්නෑ කියල🤕......පන්තියෙ හිටපු දුර්වල එකාගෙ ඉදන්ම සර් අවදානයදීල අපිට විශය කරුණු ටික නියමිත කාලෙටත් කලින් ඉවර කලා..... හැම දවසකම පේපරයක් දීල අපේ writting speed එක වගේම දැනුමත් වර්ධනය කලා... සර්ගෙ පන්ති ආවම අපේ දැනුම විතරක් නෙවේ පේපරයකට මුහුණ දෙද්දි  තීන්න ඕන දේවලුත් හරියටම අපිට කියල දීල exam එකට අපිට බය නැතුව මූහුණ දෙන විදිහ කියල දුන්නා........ අපි දැන් ඕලෙවෙල් කරල ඉවරයිනේ ඒත් තාමත් අපි ගැන සර් හොයල බලනවා ඒවට ගොඩක් ස්තූතීයී සර්🙏❤!
                    අපිට වඩා හොද ලමයි බිහිකරන්න සර්ට වාසනාව, ශක්තිය, ධෙර්ය ලැබේවා කියල ප්‍රාර්තනා කරනවා! ❤🙏😹 තෙරුවන් සරණයි!
                  </p>
                  <span style="font-size: 100%;font-family: 'Noto Sans Sinhala', sans-serif; margin-bottom: 5px;color: white;"><strong>අවිශ්ක (2020-O/L)</strong></span>

                </div>
              </div>
            </div>

          </div>


        </div>
      </div>
    </div>
  </div>
</section>
<!-- End: Our Community Section -->

<!-- Start: Meet Staff -->


<!-- End: Meet Staff -->

<!-- Start: Latest Blog -->

<!-- End: Latest Blog -->

<!-- Start: News & Event -->

<!-- End: News & Events -->
<section class="social-network section-padding" id="ContactUs">
  <div class="container">
    <div class="center-content" style="margin-bottom: 15px;">
      <h2 class="section-title">Follow Us</h2>
      <span class="underline center"></span>
    </div>
    <ul >


      <li>
        <a class="facebook" href="" target="_blank">
                            <span>
                                <i class="fa fa-facebook-f"></i>
                            </span>
        </a>
      </li>
      <li>
        <a class="youtube" href="" target="_blank">
                            <span>
                                <i class="fa fa-youtube"></i>
                            </span>
        </a>
      </li>
      <li>
        <a class="instagram" href="" target="_blank">
                            <span>
                                <i class="fa fa-instagram"></i>
                            </span>
        </a>
      </li>


      <li>
        <a class="linkedin" href="#" target="_blank">
                            <span>
                                <i class="fa fa-linkedin"></i>
                            </span>
        </a>
      </li>

      <li>
        <a class="twitter" href="#" target="_blank">
                            <span>
                                <i class="fa fa-twitter"></i>
                            </span>
        </a>
      </li>

      <li>
        <a class="whatsapp" href="" target="_blank">
                            <span>
                                <i class="fa fa-whatsapp"></i>
                            </span>
        </a>
      </li>

    </ul>

  </div>
</section>

<!-- Start: Footer -->
<footer class="site-footer">

  <div class="sub-footer">
    <div class="container">
      <div class="row">

        <div class="col-md-12 pull-right" style="text-align: center;">
          <p>© 2021 Creative Education All rights reserved</p>
          <p><a target="_blank" href="">Developed & Designed By DCSD192 Batch (Group 06)</a></p>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- End: Footer -->
<!-- Messenger Chat Plugin Code -->
<div id="fb-root"></div>

<!-- Your Chat Plugin code -->
<div id="fb-customer-chat" class="fb-customerchat">
</div>

<script>
  var chatbox = document.getElementById('fb-customer-chat');
  chatbox.setAttribute("page_id", "111332031143737");
  chatbox.setAttribute("attribution", "biz_inbox");

  window.fbAsyncInit = function() {
    FB.init({
      xfbml            : true,
      version          : 'v12.0'
    });
  };

  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
</script>
<!-- jQuery Latest Version 1.x -->
<script type="text/javascript" src="MainPage/js/jquery-1.12.4.min.js"></script>

<!-- jQuery UI -->
<script type="text/javascript" src="MainPage/js/jquery-ui.min.js"></script>

<!-- jQuery Easing -->
<script type="text/javascript" src="MainPage/js/jquery.easing.1.3.js"></script>

<!-- Bootstrap -->
<script type="text/javascript" src="MainPage/js/bootstrap.min.js"></script>

<!-- Mobile Menu -->
<script type="text/javascript" src="MainPage/js/mmenu.min.js"></script>

<!-- Harvey - State manager for media queries -->
<script type="text/javascript" src="MainPage/js/harvey.min.js"></script>

<!-- Waypoints - Load Elements on View -->
<script type="text/javascript" src="MainPage/js/waypoints.min.js"></script>

<!-- Facts Counter -->
<script type="text/javascript" src="MainPage/js/facts.counter.min.js"></script>

<!-- MixItUp - Category Filter -->
<script type="text/javascript" src="MainPage/js/mixitup.min.js"></script>

<!-- Owl Carousel -->
<script type="text/javascript" src="MainPage/js/owl.carousel.min.js"></script>

<!-- Accordion -->
<script type="text/javascript" src="MainPage/js/accordion.min.js"></script>

<!-- Responsive Tabs -->
<script type="text/javascript" src="MainPage/js/responsive.tabs.min.js"></script>

<!-- Responsive Table -->
<script type="text/javascript" src="MainPage/js/responsive.table.min.js"></script>

<!-- Masonry -->
<script type="text/javascript" src="MainPage/js/masonry.min.js"></script>

<!-- Carousel Swipe -->
<script type="text/javascript" src="MainPage/js/carousel.swipe.min.js"></script>

<!-- bxSlider -->
<script type="text/javascript" src="MainPage/js/bxslider.min.js"></script>

<!-- Custom Scripts -->
<script type="text/javascript" src="MainPage/js/main.js"></script>

</body>

<script>
  $(function () {
    $(document).scroll(function () {
      var $nav = $(".navbar-wrapper");
      $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    });
  });
</script>
<script>
  $(document).ready(function() {
    //carousel options
    $('#quote-carousel').carousel({
      pause: true, interval: 10000,
    });
  });
</script>
<script>
  $(document).ready(function(){
    // Add smooth scrolling to all links
    $("a").on('click', function(event) {

      // Make sure this.hash has a value before overriding default behavior
      if (this.hash !== "") {
        // Prevent default anchor click behavior
        event.preventDefault();

        // Store hash
        var hash = this.hash;

        // Using jQuery's animate() method to add smooth page scroll
        // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
        $('html, body').animate({
          scrollTop: $(hash).offset().top
        }, 1800, function(){

          // Add hash (#) to URL when done scrolling (default click behavior)
          window.location.hash = hash;
        });
      } // End if
    });
  });
</script>
</html>