package kr.co.everyfarm.product;

import org.python.util.PythonInterpreter;

public class jyathontest2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		PythonInterpreter python = new PythonInterpreter();
		python.execfile("D:/test/testplot3.py");
		
		python.close();
		
	}

}
