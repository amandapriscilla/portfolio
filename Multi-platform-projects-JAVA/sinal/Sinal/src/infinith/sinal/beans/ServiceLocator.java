package infinith.sinal.beans;

import infinith.sinal.interfaces.INoticiaRemote;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ServiceLocator {



		private Context contexto;
		private Map<String, Object> cache;
		private static ServiceLocator instance;
		
		public static ServiceLocator getInstance()
		{
			if(instance == null)
			{
				instance = new ServiceLocator();
			}
			return instance;
		}
		 
		private ServiceLocator()
		{
			try
			{
				contexto = getInitialContext();
				cache = new HashMap<String, Object>();
			}
			catch(NamingException ne)
			{
				ne.printStackTrace();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}

		public INoticiaRemote getAccountSessionNoticia()
		{
			return (INoticiaRemote)getService("NoticiaBean/remote");
		}
		
		
		private Object getService(String serviceID)
		{
			if(cache.containsKey(serviceID))
			{
				return cache.get(serviceID);
			}
			else
			{
				Object service = null;
				try
				{
					service = contexto.lookup(serviceID);
				}
				catch (NamingException e)
				{
					e.printStackTrace();
				}
				cache.put(serviceID, service);
				return service;
			}
		}
		
		public static InitialContext getInitialContext() throws NamingException
		{
			Properties env = new Properties();
			env.put(Context.SECURITY_PRINCIPAL, "guest" );
			env.put(Context.SECURITY_CREDENTIALS, "guest" );
			env.put(Context.INITIAL_CONTEXT_FACTORY,
					"org.jboss.security.jndi.JndiLoginInitialContextFactory");
			env.put(Context.PROVIDER_URL, "jnp://localhost:1099");
			return new InitialContext(env);
		}


	
	
}
