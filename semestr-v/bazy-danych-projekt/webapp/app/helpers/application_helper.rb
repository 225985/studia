module ApplicationHelper
  def task_status_class(task)
    case task.status
    when Db::TaskStatus.value_of("NEW")
      "notice"
    when Db::TaskStatus.value_of("IN_PROGRESS")
      "warning"
    when Db::TaskStatus.value_of("CLOSED")
      "success"
    end
  end

  def task_kind_class(task)
    case task.kind
    when Db::TaskKind.value_of("BUG")
      "important"
    when Db::TaskKind.value_of("FEATURE")
      "success"
    end
  end
end
