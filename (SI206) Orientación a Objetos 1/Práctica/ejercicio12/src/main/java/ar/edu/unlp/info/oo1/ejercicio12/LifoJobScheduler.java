package ar.edu.unlp.info.oo1.ejercicio12;

public class LifoJobScheduler extends JobScheduler{
	@Override
	//no use this.jobs.getLast() porque en la catedra usan el siguiente ejemplo:
	public JobDescription next() {
		JobDescription nextJob = this.jobs.get(this.jobs.size()-1);
		this.unschedule(nextJob);
		return nextJob;
	}
}
