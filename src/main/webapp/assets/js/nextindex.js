/**
 * 
 */
 
    $(document).ready(function() {
      $('.nav-link').click(function(e) {
        e.preventDefault();
        var pageName = $(this).find('.nav-link-text').text();
        $('#breadcrumbTitle').text(pageName);
        $('#pageName').text(pageName);
      });
    });
