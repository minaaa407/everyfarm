package kr.co.everyfarm.product;

import java.io.IOException;

import org.python.util.PythonInterpreter;

public class jyathontest7 {
	
	private static PythonInterpreter intPre;

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		   Runtime runtime = Runtime.getRuntime();
		   Process p1 = runtime.exec("C:\\ProgramData\\Anaconda3\\python.exe  "
		   		+ "D:\\test\\testplot.py");
		
		
	}

}
