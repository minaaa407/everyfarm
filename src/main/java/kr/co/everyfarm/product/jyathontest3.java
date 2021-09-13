package kr.co.everyfarm.product;

import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;

public class jyathontest3 {
	


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		PythonInterpreter interpreter = new PythonInterpreter();
		interpreter.exec("import sys\nsys.path.append('pathToModules if they are not there by default')\nimport yourModule");
		// execute a function that takes a string and returns a string
		PyObject someFunc = interpreter.get("funcName");
		PyObject result = someFunc.__call__(new PyString("Test!"));
		String realResult = (String) result.__tojava__(String.class);
		
		
	}

}
