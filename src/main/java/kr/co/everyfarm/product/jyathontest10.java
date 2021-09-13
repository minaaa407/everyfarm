package kr.co.everyfarm.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.python.util.PythonInterpreter;

public class jyathontest10 {
	
	private static PythonInterpreter intPre;

	public static void main(String[] args) throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		Process proc;
		try {
			proc = Runtime.getRuntime().exec("C:\\\\ProgramData\\\\Anaconda3\\\\python.exe D:\\test\\a1.py");
			
			BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
			String line = null;
			while ((line = in.readLine()) != null) {
				System.out.println(line);
			}
			in.close();
			proc.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} 
	  
		
		
	}

}
