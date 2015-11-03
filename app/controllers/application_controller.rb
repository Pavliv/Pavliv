class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    render text: "hello, world!"
  end

  def fib(n)
  	n.times.each_with_object([0,1]) { |num, obj| obj << obj[-2] + obj[-1] }
  end

  def fibonacci( n )
  	fib = Hash.new {|hsh, i| hsh[i] = fib[i-2] + fib[i-1]}.update(0 => 0, 1 => 1)
  	return fib[n]
    # return  n  if ( 0..1 ).include? n 
    # ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
  end

  def get_fibo
  	render text: fibonacci( 500 )
  	# render text: fib(10)
  end

  def unique_names
  	a = "Maryan"
  	names = (0..14).to_a.map { |n| b = a = a.next }
  	groups = names.each_slice(5).to_a
  	render text: groups
  end


end