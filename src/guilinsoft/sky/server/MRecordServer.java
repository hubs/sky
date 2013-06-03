package guilinsoft.sky.server;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.serialization.ClassResolvers;
import io.netty.handler.codec.serialization.ObjectDecoder;
import io.netty.handler.codec.serialization.ObjectEncoder;

import java.net.InetSocketAddress;

import com.jzero.util.MCheck;
import com.jzero.util.MPrint;
import com.jzero.util.MPro;

public class MRecordServer {
	private static ServerBootstrap s=new ServerBootstrap();
	private static MRecordServer server=new MRecordServer();
	private MRecordServer(){}
	public static MRecordServer me(){
		return server;
	}
	public void start(){
		MPrint.print("已开记服务器监听.");
		 try {
			s.group(new NioEventLoopGroup(), new NioEventLoopGroup())
			  .channel(NioServerSocketChannel.class)
			  .childHandler(new ChannelInitializer<Channel>() {
				@Override
				protected void initChannel(Channel ch) throws Exception {
					ch.pipeline().addLast(new ObjectEncoder(),
							new ObjectDecoder(ClassResolvers.cacheDisabled(null)),
							new MRecordServerHandler()
					
					);
				}
			});
		     // Bind and start to accept incoming connections.
			s.bind(new InetSocketAddress(MPro.me().getInt("target_port"))).sync().channel().closeFuture().sync();
		 } catch (InterruptedException e) {
			e.printStackTrace();
		 }finally{
			 s.shutdown();
		 }
	}
	public void stop(){
		if(MCheck.isNull(s)){
			s.shutdown();
		}
	}
	public void restart(){
		stop();
		start();
	}
}
