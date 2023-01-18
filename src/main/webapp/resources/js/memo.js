$('.menuSub').hide();
$('.menu').on('click',function(){
    $(this).next().slideToggle();
    $(this).parent().siblings().find('ul').slideUp();
})