<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
  font-size: 100%;
  font-family: 'Open Sans', sans-serif;
  color: $dark;
  background: $dark;
}

a {
  text-decoration: none;
  
}
.wrapper {
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}

.pagination {
  
  &__item {
    display: inline-block;
    margin: 0 10px;
  }
  
  &__link {
    position: relative;
    text-indent: -99em;
    overflow: hiddin;
    display:block;
    width: 30px;
    height: 30px;
    
    &:before,
    &:after {
      content: '';
      display:block;
      position: absolute;
      top: 0;
      width: 100%;
      height: 100%;
      border-radius: 50%;
      border: 3px solid $clouds;
      transition: all 600ms cubic-bezier(0.68, -0.55, 0.265, 1.55);
    }
    
    &:before {
      background: $clouds;
      transform: scale(.2);
    }
    &:after {
      
    }
    &:hover {
      &:after {
        transform: scale(1.1);
      }
    }
    &.is_active {
      &:before {
        transform: scale(.5);
      }
      &:after {
        transform: scale(.2);
      }
    }
  }
}

</style>
<body>
<div class="wrapper">
  <ul class="pagination">
    <li class="pagination__item"><a href="#" class="pagination__link">1</a></li>
    <li class="pagination__item"><a href="#" class="pagination__link is_active">2</a></li>
    <li class="pagination__item"><a href="#" class="pagination__link">3</a></li>
    <li class="pagination__item"><a href="#" class="pagination__link">4</a></li>
    <li class="pagination__item"><a href="#" class="pagination__link">5</a></li>
    <li class="pagination__item"><a href="#" class="pagination__link">6</a></li>
  </ul>
</div>
<script>
var link = $('.pagination__link');
link.on('click', function(){
  link.removeClass('is_active');
  $(this).addClass('is_active');
});
</script>
</body>
</html>