import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

import it.gameshub.test.bean.AllBeanTests;
import it.gameshub.test.model.AllModelTests;

public class Test {

	public static void main(String[] args) {
		Result result = JUnitCore.runClasses(AllBeanTests.class);
		for (Failure failure : result.getFailures()) {
			System.out.println(failure.toString());
		}
		System.out.println(result.wasSuccessful());

		result = JUnitCore.runClasses(AllModelTests.class);
		for (Failure failure : result.getFailures()) {
			System.out.println(failure.toString());
		}
		System.out.println(result.wasSuccessful());
	}

}
