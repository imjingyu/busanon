<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.key2 { 
  
  
  box-sizing: border-box;}
  .session-title.row {
  justify-content: center;
  padding: inherit;
  
  }

#key {
  color: #333;
  font-family: tahoma;
  font-size: 3rem;
  font-weight: 100;
  line-height: 1.5;
  text-transform: uppercase;
  white-space: nowrap;
  overflow: hidden;
  position: relative;
  width: 600px;
}

#key span {
    font-size: 40px;
    margin-left: 50px;
    float: none;
    font-style: inherit;
    font-family: inherit;
}

.message {
  background-color: #ff5f68;
  color: #fdfff5;
  display: block;
  font-weight: 900;
  overflow: hidden;
  position: absolute;
  padding-left: 0.5rem;
  top: 0.2rem;
  left: 270px;
  animation: openclose 5s ease-in-out infinite;
}

.word1, .word2, .word3 {
  font-family: tahoma;
}

@keyframes openclose {
   0% {
    top: 0rem;
    width: 0;
  }
  5% {
    width: 0;
  }
  15% {
    width: 200px;
  }
  30% {
    top: 0rem;
    width: 200px;
  }
  33% {
    top: 0rem;
    width: 0;
  }
  35% {
    top: 0rem;
    width: 0;
  }
  38% {
    top: -4.5rem;
    
  }
  48% {
    top: -4.5rem;
    width: 200px;
  }
  62% {
    top: -4.5rem;
    width: 200px;
  }
  66% {
    top: -4.5rem;
    width: 0;
    text-indent: 0;
  }
  71% {
    top: -9rem;
    width: 0;
    text-indent: 5px;
  }
  86% {
    top: -9rem;
    width: 300px;
  }
  95% {
    top: -9rem;
    width: 300px;
  }
  98% {
    top: -9rem;
    width: 0;
    text-indent: 5px;
  }
  100% {
    top: 0;
    width: 0;
    text-indent: 0;
  }
}
</style>
</head>
<body>
<div class="key2">
<h1 id="key">
  <span>부산 온나#</span>
  <div class="message">
    <div class="word1">해 운 대 </div>
    <div class="word2">광 안 리</div>
    <div class="word3">흰여울 마을</div>
  </div>
</h1>
</div>
</body>
</html>