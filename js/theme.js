;(function($) {
    "use strict"  
    
    //* mainNavbar
    function mainNavbar(){
        if ( $('#main_navbar').length ){ 
             $('#main_navbar').affix({
                offset: {
                    top: 10,
                    bottom: function () {
                        return (this.bottom = $('.footer').outerHeight(true))
                    }
                }
            }); 
        };
    };
    
    //* menuBg
    function menuBg(){
        if ( $('.navbar.navbar-default').length ){ 
            $(window).scroll(function() {
                var scroll = $(window).scrollTop();   
                if (scroll >= 120 ) {
                    $(".navbar.navbar-default, .nav_resturent").addClass("menu_bg");
                } else {
                    $(".navbar.navbar-default, .nav_resturent").removeClass("menu_bg");
                }
            });
        };
    };
    
    //* nav_searchFrom
    function searchFrom(){
        if ( $('.nav_searchFrom').length ){  
             $('.nav_searchFrom').on('click',function(){
                $('.searchForm').toggleClass('show');
                return false
            });
            $('.form_hide').on('click',function(){
                $('.searchForm').removeClass('show')
            });
        };
    };
     
    
    //* counterUp JS
    function counterUp(){
        if ( $('.counter').length ){ 
            $('.counter').counterUp({
                delay: 10,
                time: 400
            });
        }
    }
    
    // Stellar 
    $(function(){
        $.stellar({
            horizontalScrolling: false,
            verticalOffset: 40
        });
    }); 
    
    //* Other_testimonial_client_area
    function testimonialClient() {
        if ( $('.other_testimonial_area').length ){
            $('.other_testimonial_area').owlCarousel({
                loop:true,
                items:1,
                nav:true, 
                navText: ['<i class="lnr lnr-arrow-left"></i><h5>precious</h5>','<h5>next</h5><i class="lnr lnr-arrow-right"></i>']
            });
        };
    };  
     
    
    /*Function Calls*/
    mainNavbar ();
    menuBg ();
    searchFrom ();
    new WOW().init(); 
    counterUp(); 
    testimonialClient(); 
     
})(jQuery);