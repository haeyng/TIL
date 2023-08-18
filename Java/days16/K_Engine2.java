package days16;

public class K_Engine2 extends K_Engine {

	//int speed;
	
	@Override
	public void moreFuel(int fuel) {
		this.speed += fuel * 0.12;
	}

	@Override
	public void lessFuel(int fuel) {
		this.speed -= fuel * 0.12;
	}

	@Override
	public void stop() {
		this.speed = 0;
	}

}
