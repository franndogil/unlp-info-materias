package ar.edu.unlp.info.oo1.ejercicio12;

public class HighestPriorityJobScheduler extends JobScheduler{
	@Override
	public JobDescription next() {
		JobDescription nextJob;
		nextJob = this.jobs.stream()
				.max((j1, j2) -> Double.compare(j1.getPriority(), j2.getPriority()))
				.orElse(null);
		this.unschedule(nextJob);
		return nextJob;
	}
}
