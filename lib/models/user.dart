class Doctor {
  final String doc_name;
  final String doc_img;
  final String doc_hospital;
  final String doc_specialization;
  final List<String> doc_slot_time;
  final List<String> doc_symptoms;

  Doctor({
    required this.doc_name,
    required this.doc_img,
    required this.doc_hospital,
    required this.doc_specialization,
    required this.doc_symptoms,
    required this.doc_slot_time,
  });
}
