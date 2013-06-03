package guilinsoft.sky.server;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;

import com.jzero.util.MPrint;

public class Test {

	public static void main(String[] args) {
		
		 Socket socket = new Socket();
		   try {
			socket.connect(new InetSocketAddress("192.168.1.119", 9999), 2000);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
