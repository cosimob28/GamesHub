package it.gameshub.test.bean;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ CarrelloTest.class, CartaTest.class, ComposizioneTest.class, GiocoTest.class, ImmagineTest.class,
		ItemCompTest.class, ItemOrderTest.class, OrdineTest.class, UtenteTest.class })
public class AllBeanTests {

}
