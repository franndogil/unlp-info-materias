package ar.edu.unlp.info.oo1.ejercicio12;

public class MostEffortJobScheduler extends JobScheduler{
	@Override
	public JobDescription next() {
		JobDescription nextJob;
		nextJob = this.jobs.stream()
				.max((j1, j2) -> Double.compare(j1.getEffort(), j2.getEffort()))
				.orElse(null);
		this.unschedule(nextJob);
		return nextJob;
	}
}
