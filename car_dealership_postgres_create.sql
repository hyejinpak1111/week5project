CREATE TABLE "public.customer" (
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



CREATE TABLE "public.inventory" (
	"inventory_id" integer NOT NULL,
	"make" varchar(255) NOT NULL,
	"model" varchar(255) NOT NULL,
	"year" varchar(255) NOT NULL,
	"color" varchar(255) NOT NULL,
	"amount" money NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("inventory_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales-person" (
	"sales-person_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"inventory_id" varchar(255) NOT NULL,
	CONSTRAINT "sales-person_pk" PRIMARY KEY ("sales-person_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.payment" (
	"payment_id" integer NOT NULL,
	"total" integer NOT NULL,
	"sales-person_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"inventory" integer NOT NULL,
	CONSTRAINT "payment_pk" PRIMARY KEY ("payment_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.service" (
	"service_id" integer NOT NULL,
	"payment_id" integer NOT NULL,
	"mechanic_id" integer NOT NULL,
	"service_type" varchar(255) NOT NULL,
	"amount" varchar(255) NOT NULL,
	"customer_id" integer NOT NULL,
	CONSTRAINT "service_pk" PRIMARY KEY ("service_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.mechanic" (
	"mechanic_id" integer NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "mechanic_pk" PRIMARY KEY ("mechanic_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "sales-person" ADD CONSTRAINT "sales-person_fk0" FOREIGN KEY ("inventory_id") REFERENCES "inventory"("inventory_id");

ALTER TABLE "payment" ADD CONSTRAINT "payment_fk0" FOREIGN KEY ("sales-person_id") REFERENCES "customer"("customer_id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk1" FOREIGN KEY ("customer_id") REFERENCES "sales-person"("sales-person_id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk2" FOREIGN KEY ("inventory") REFERENCES "inventory"("inventory_id");

ALTER TABLE "service" ADD CONSTRAINT "service_fk0" FOREIGN KEY ("mechanic_id") REFERENCES "mechanic"("mechanic_id");
ALTER TABLE "service" ADD CONSTRAINT "service_fk1" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");








