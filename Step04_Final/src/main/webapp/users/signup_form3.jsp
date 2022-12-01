<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form3.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
   <div class="container" id="app">
      <h3>회원 가입 폼 입니다.</h3>
      <p>폼의 유효성 여부 : {{isFormValid}}</p>
      <form action="signup.jsp" method="post" id="signupForm" v-on:submit="onSubmit">
         <div>
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" v-on:keyup="IDF" v-bind:class="[ isIdValid ? 'is-valid' : 'is-invalid']" v-model="id" type="text" name="id" id="id"/>
            <div class="valid-feedback">사용 가능한 아이디 입니다.</div>
            <div class="invalid-feedback">사용할 수 없는 아이디 입니다.</div>
         </div>
         <div>
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" v-on:keyup="PWDF" v-bind:class="[ isPwdValid ? 'is-valid' : 'is-invalid']" v-model="pwd" type="password" name="pwd" id="pwd"/>
            <div class="invalid-feedback">비밀 번호를 확인 하세요</div>
         </div>
         <div>
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input class="form-control" v-on:keyup="PWDF" type="password" name="pwd2" id="pwd2" v-model="pwd2"/>
         </div>
         
         <div>
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" v-on:keyup="EMAF" v-bind:class="[ isEmailValid ? 'is-valid' : 'is-invalid']" v-model="email" type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button class="btn btn-outline-primary" v-bind:disabled="!isFormValid" type="submit">가입</button>
         <a class="btn btn-warning" href="../index.jsp">돌아가기</a>
      </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script>
    let app=new Vue({
            el:"#app",
            data:{
            	isIdValid:true,
            	isPwdValid:true,
            	isEmailValid:true,
            	id:"",
            	pwd:"",
            	pwd2:"",
            	email:""
            },
            computed:{
            	isFormValid(){
            		//모델을 활용해서 얻어낼 값이 있으면 얻어낸다.
            		let result=this.isIdValid&&this.isPwdValid&&this.isEmailValid;
            		//함수에서 리턴해주는 값을 모델처럼 사용한다.
            		return result;
            	}
            },
            methods:{
            	IDF:function(){   
            		const reg=/^[a-z].{4,9}$/;
            		console.log(reg.test(this.id));
          		   if(!reg.test(this.id)){
     			    	   this.isIdValid=false;
     			    	   return;
      		       } 
          		   const self = this;
            		
            		fetch("checkid.jsp?inputId="+this.id)
                      .then(function(response){
                         return response.json();
                      })
                      .then(function(data){
                         //3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
                    	  console.log(data);
                          if(data.isExist){
                            self.isIdValid=false;
                          }else{
                          	self.isIdValid=true;
                          }
                         
                      });
            		
            		
           		      	},
            	PWDF:function(){
            		const reg=/[\W]/;
        		   if((!reg.test(this.pwd))||(this.pwd!=this.pwd2)){
   			    	   this.isPwdValid=false;
    		       } else{
  			     	   this.isPwdValid=true;
    		       }
      		      	},
            	EMAF:function(){
            		const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
            		if(!reg.test(this.email)){
      			   this.isEmailValid=false;
     		    } else{
     			    this.isEmailValid=true;
      		     }
         		},
				onSubmit:function(e){
					if(this.isIdValid&&this.isPwdValid&&this.isEmailValid){
						
               		}else{
            			e.preventDefault();
              		}
				}
		}
    });
</script>
</body>
</html>