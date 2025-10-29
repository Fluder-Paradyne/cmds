## To delete all BulkReindexJob, trying to reindex Lead, into a particualr index
```shell
job_klass_set = Set.new
jb = nil
count = 0
Sidekiq::Queue.all.each do |queue|
  if queue.name != 'searchkick'
    next
  end
  queue.each do |job|
    job_klass_set.add(job.args[0]["job_class"]) if job.args[0].is_a?(Hash) && job.args[0]["job_class"]
    if job.args[0]["job_class"] == "Searchkick::BulkReindexJob"
      jb = job
      if jb.args[0]["arguments"][0]["class_name"]  == "Lead" && jb.args[0]["arguments"][0]["index_name"]  == "lead_production"
        jb.delete
      end
    end
  end
end
pp "number of jobs: #{count}"
```
