package kr.co.everyfarm.product;

import org.python.core.PyInteger;
import org.python.util.PythonInterpreter;

public class jyathontest6 {
	
	private static PythonInterpreter intPre;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		intPre = new PythonInterpreter();
		intPre.execfile("D:/test/testplot3.py");
		intPre.exec("print(main())");
		
		
	}

}
