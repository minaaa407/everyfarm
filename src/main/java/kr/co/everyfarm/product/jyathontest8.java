package kr.co.everyfarm.product;

import java.io.IOException;

import org.python.util.PythonInterpreter;


public class jyathontest8 {
	
	private static PythonInterpreter interpreter;

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		  System.setProperty("pytho.canchedir.skip", "true");
		  PythonInterpreter interpreter = new PythonInterpreter();
		  interpreter.execfile("D:\\test\\testplot.py");
		  interpreter.exec("print(main())");
		  interpreter.close();
		
		
	}

}
