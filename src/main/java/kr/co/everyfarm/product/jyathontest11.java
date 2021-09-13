package kr.co.everyfarm.product;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.python.util.PythonInterpreter;

public class jyathontest11 {
	
	private static PythonInterpreter intPre;

	public static void main(String[] args) throws IOException, InterruptedException {
		// TODO Auto-generated method stub
		String url = "http://127.0.0.1:5000/img";
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

			String line = null;

			while ((line = br.readLine()) != null) {
				sb = sb + line + "\n";
			}
			System.out.println("========br======" + sb.toString());
			if (sb.toString().contains("ok")) {
				System.out.println("test");
				
			}
			br.close();

			System.out.println("" + sb.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
		
		
	}

}
