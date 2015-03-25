package com.xuh.platform.base.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 反射工具类
 * 
 * @author xufeng
 * @date 2014.8.22
 */
public class ReflectUtil {

	private static Log log = LogFactory.getLog(ReflectUtil.class);
	
	/**
	 * 根据类名反射创建对象
	 * 
	 * @param name
	 *            类名
	 * @return 对象
	 * @throws Exception
	 */
	public static Object getInstance(String name) throws Exception {
		Class<?> cls = Class.forName(name);
		return cls.newInstance();
	}

	/**
	 * 反射方法，打印对象的属性，方法，构造器属性
	 * 
	 * @param obj
	 *            被反射对象
	 */
	public static void reflect(Object obj) {
		Class<?> cls = obj.getClass();
		log.info("************构  造  器************");
		Constructor<?>[] constructors = cls.getConstructors();
		for (Constructor<?> constructor : constructors) {
			log.info("构造器名称:" + constructor.getName() + "\t" + "    "
					+ "构造器参数类型:"
					+ Arrays.toString(constructor.getParameterTypes()));
		}
		log.info("************属     性************");
		Field[] fields = cls.getDeclaredFields();
		// cls.getFields() 该方法只能访问共有的属性
		// cls.getDeclaredFields() 可以访问私有属性
		for (Field field : fields) {
			log.info("属性名称:" + field.getName() + "\t" + "属性类型:"
					+ field.getType() + "\t");
		}
		System.out.println("************方   法************");
		Method[] methods = cls.getMethods();
		for (Method method : methods) {
			log.info("方法名:" + method.getName() + "\t" + "方法返回类型："
					+ method.getReturnType() + "\t" + "方法参数类型:"
					+ Arrays.toString(method.getParameterTypes()));
		}
	}

	/**
	 * 
	 * @param obj
	 *            访问对象
	 * @param filedname
	 *            对象的属性
	 * @return 返回对象的属性值
	 * @throws Exception
	 */
	public static Object getFieldValue(Object obj, String filedname)
			throws Exception {
		// 反射出类型
		Class<?> cls = obj.getClass();
		Field field = null;
		// 反射出类型字段
		try {
			field = cls.getDeclaredField(filedname);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("没有这个字段：" + filedname);
		}

		// 获取属性时，压制Java对访问修饰符的检查
		field.setAccessible(true);
		// 在对象obj上读取field属性的值
		Object val = field.get(obj);
		return val;
	}

	/**
	 * 
	 * @param obj
	 *            访问对象
	 * @param filedname
	 *            对象的属性
	 * @return 返回对象的属性值
	 * @throws Exception
	 */
	public static void setFieldValue(Object obj, String filedname, String value)
			throws Exception {
		// 反射出类型
		Class<?> cls = obj.getClass();
		Field field = null;
		// 反射出类型字段
		try {
			field = cls.getDeclaredField(filedname);
			if (field != null) {
				// 获取属性时，压制Java对访问修饰符的检查
				field.setAccessible(true);
				field.set(obj, value);
				field.setAccessible(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("没有这个字段：" + filedname);
		}
	}
}
