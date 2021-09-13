package kr.co.everyfarm.product;

import java.io.IOException;

public class jyathontest4 {
	
	

	public static void main(String[] args) throws IOException, InterruptedException {
		String command = "C:\\ProgramData\\Anaconda3\\python.exe";  // 명령어
		String arg1 = "D:\\test\\a1.py"; // 인자
		ProcessBuilder builder = new ProcessBuilder(command, arg1);
		Process process = builder.start();
		int exitVal = process.waitFor();  // 자식 프로세스가 종료될 때까지 기다림
		if(exitVal != 0) {
		  // 비정상 종료
			System.out.println("비정상?");
		}
		
	}

} 
