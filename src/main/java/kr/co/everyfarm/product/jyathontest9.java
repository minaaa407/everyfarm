package kr.co.everyfarm.product;

import java.io.IOException;

import org.python.util.PythonInterpreter;

public class jyathontest9 {
	
	private static PythonInterpreter intPre;

	public static void main(String[] args) throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		 System.setProperty("python.cachedir.skip", "true");
	        PythonInterpreter interpreter = new PythonInterpreter();
	        interpreter.execfile("D:\\test\\a2.py");
	        interpreter.close();
	  
		
		
	}

}
