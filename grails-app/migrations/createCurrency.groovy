databaseChangeLog = {

	changeSet(author: "hesamyou (generated)", id: "1405852678081-1") {
		createTable(tableName: "CURRENCY") {
			column(autoIncrement: "true", name: "ID", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "CONSTRAINT_5")
			}

			column(name: "VERSION", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "NAME", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "RATE", type: "float") {
				constraints(nullable: "false")
			}
		}
	}
}
