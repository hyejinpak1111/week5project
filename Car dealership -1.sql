CREATE TABLE "customer" (
	"customer_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"phone_number" varchar(255) NOT NULL,
	"email" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "inventory" (
	"inventory_id" serial NOT NULL,
	"make" varchar(255) NOT NULL,
	"model" varchar(255) NOT NULL,
	"year" varchar(255) NOT NULL,
	"color" varchar(255) NOT NULL,
	"amount" FLOAT NOT NULL,
	"serial_number" varchar NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("inventory_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "salesperson" (
	"salesperson_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"inventory_id" varchar(255),
	CONSTRAINT "salesperson_pk" PRIMARY KEY ("salesperson_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "payment" (
	"payment_id" serial NOT NULL,
	"total" integer NOT NULL,
	"salesperson_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"inventory" integer NOT NULL,
	CONSTRAINT "payment_pk" PRIMARY KEY ("payment_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "servicepayment" (
	"servicepayment_id" serial NOT NULL,
	"serivetotal" integer NOT NULL,
	"mechanic_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"service_id" integer NOT NULL,
	CONSTRAINT "servicepayment_pk" PRIMARY KEY ("servicepayment_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "service" (
	"service_id" serial NOT NULL,
	"servicepayment_id" integer NOT NULL,
	"mechanic_id" integer NOT NULL,
	"service_type" varchar(255) NOT NULL,
	"amount" varchar(255) NOT NULL,
	"customer_id" integer NOT NULL,
	CONSTRAINT "service_pk" PRIMARY KEY ("service_id")
) WITH (
  OIDS=FALSE
);
CREATE TABLE "mechanic" (
	"mechanic_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "mechanic_pk" PRIMARY KEY ("mechanic_id")
) WITH (
  OIDS=FALSE
);
ALTER TABLE "sale-person" ADD CONSTRAINT "sale-person_fk0" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("inventory_id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk0" FOREIGN KEY ("sale-person_id") REFERENCES "sale-person"("sale-person_id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk1" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk2" FOREIGN KEY ("inventory") REFERENCES "inventory"("inventory_id");
ALTER TABLE "service" ADD CONSTRAINT "service_fk0" FOREIGN KEY ("payment_id") REFERENCES "payment"("payment_id");
ALTER TABLE "service" ADD CONSTRAINT "service_fk1" FOREIGN KEY ("mechanic_id") REFERENCES "mechanic"("mechanic_id");
ALTER TABLE "service" ADD CONSTRAINT "service_fk2" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");