<ul class="nav navbar-nav pull-right"> 
   @if(Auth::guest())
	    <span class="glyphicon glyphicon-pencil"
		aria-hidden="true"></span>
		<li><a href="{{route('register')}}">Register</a><span class="glyphicon glyphicon-pencil" style="color:red"
		aria-hidden="true"></span></li> 
		<li><a href="{{route('login')}}">Login</a><span class="glyphicon glyphicon-hand-right" style="color:red"
		aria-hidden="true"></span></li> 
		
	
	@else
		<li><a href="{{route('logout')}}">Logout</a><span class="glyphicon glyphicon-log-out" style="color:red"
		aria-hidden="true"></span></li> 
	@endif
</ul>