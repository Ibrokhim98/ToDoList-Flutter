// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String taskTitle;
  final DateTime targetDate;
  final String status;
  Task(
      {@required this.id,
      @required this.taskTitle,
      this.targetDate,
      @required this.status});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      taskTitle: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_title']),
      targetDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}target_date']),
      status:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || taskTitle != null) {
      map['task_title'] = Variable<String>(taskTitle);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<DateTime>(targetDate);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      taskTitle: taskTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(taskTitle),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      taskTitle: serializer.fromJson<String>(json['taskTitle']),
      targetDate: serializer.fromJson<DateTime>(json['targetDate']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'taskTitle': serializer.toJson<String>(taskTitle),
      'targetDate': serializer.toJson<DateTime>(targetDate),
      'status': serializer.toJson<String>(status),
    };
  }

  Task copyWith(
          {int id, String taskTitle, DateTime targetDate, String status}) =>
      Task(
        id: id ?? this.id,
        taskTitle: taskTitle ?? this.taskTitle,
        targetDate: targetDate ?? this.targetDate,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(taskTitle.hashCode, $mrjc(targetDate.hashCode, status.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.taskTitle == this.taskTitle &&
          other.targetDate == this.targetDate &&
          other.status == this.status);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> taskTitle;
  final Value<DateTime> targetDate;
  final Value<String> status;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.taskTitle = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.status = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    @required String taskTitle,
    this.targetDate = const Value.absent(),
    @required String status,
  })  : taskTitle = Value(taskTitle),
        status = Value(status);
  static Insertable<Task> custom({
    Expression<int> id,
    Expression<String> taskTitle,
    Expression<DateTime> targetDate,
    Expression<String> status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskTitle != null) 'task_title': taskTitle,
      if (targetDate != null) 'target_date': targetDate,
      if (status != null) 'status': status,
    });
  }

  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> taskTitle,
      Value<DateTime> targetDate,
      Value<String> status}) {
    return TasksCompanion(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      targetDate: targetDate ?? this.targetDate,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (taskTitle.present) {
      map['task_title'] = Variable<String>(taskTitle.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<DateTime>(targetDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('taskTitle: $taskTitle, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _taskTitleMeta = const VerificationMeta('taskTitle');
  GeneratedTextColumn _taskTitle;
  @override
  GeneratedTextColumn get taskTitle => _taskTitle ??= _constructTaskTitle();
  GeneratedTextColumn _constructTaskTitle() {
    return GeneratedTextColumn(
      'task_title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _targetDateMeta = const VerificationMeta('targetDate');
  GeneratedDateTimeColumn _targetDate;
  @override
  GeneratedDateTimeColumn get targetDate =>
      _targetDate ??= _constructTargetDate();
  GeneratedDateTimeColumn _constructTargetDate() {
    return GeneratedDateTimeColumn(
      'target_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedTextColumn _status;
  @override
  GeneratedTextColumn get status => _status ??= _constructStatus();
  GeneratedTextColumn _constructStatus() {
    return GeneratedTextColumn(
      'status',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, taskTitle, targetDate, status];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('task_title')) {
      context.handle(_taskTitleMeta,
          taskTitle.isAcceptableOrUnknown(data['task_title'], _taskTitleMeta));
    } else if (isInserting) {
      context.missing(_taskTitleMeta);
    }
    if (data.containsKey('target_date')) {
      context.handle(
          _targetDateMeta,
          targetDate.isAcceptableOrUnknown(
              data['target_date'], _targetDateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
