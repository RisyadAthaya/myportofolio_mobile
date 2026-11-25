import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = "";
  String _description = "";
  String _projectUrl = "";
  String _projectImageUrl = "";
  bool _isSubmitting = false;

  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    if (uri == null || uri.host.isEmpty) return false;
    return uri.scheme == 'http' || uri.scheme == 'https';
  }

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return "$label tidak boleh kosong!";
    }
    return null;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (!await ensureLoggedIn(context)) return;
    if (!mounted) return;

    final authState = context.read<AuthState>();
    final apiClient = context.read<ApiClient>();
    final newProject = Project(
      title: _title.trim(),
      description: _description.trim(),
      projectUrl: _projectUrl.trim(),
      projectImageUrl: _projectImageUrl.trim(),
    );

    setState(() => _isSubmitting = true);
    try {
      final created = await apiClient.createProject(
        newProject,
        token: authState.token!,
      );
      if (!mounted) return;
      _showCreatedDialog(created);
    } on ApiException catch (e) {
      if (!mounted) return;
      await _handleApiError(e, authState);
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  Future<void> _handleApiError(ApiException e, AuthState authState) async {
    if (e.statusCode != 401) {
      _showSnackBar("Gagal menyimpan proyek (${e.statusCode}): ${e.message}");
      return;
    }

    await authState.logout();
    if (!mounted) return;
    _showSnackBar("Sesi telah berakhir. Silakan login ulang.");
    await ensureLoggedIn(context);
  }

  void _showCreatedDialog(Project project) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Proyek berhasil ditambahkan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Judul: ${project.title}'),
                Text('Deskripsi: ${project.description}'),
                Text('URL Proyek: ${project.projectUrl}'),
                if (project.projectImageUrl.isNotEmpty)
                  Text('URL Gambar: ${project.projectImageUrl}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildField({
    required String label,
    required ValueChanged<String> onChanged,
    FormFieldValidator<String>? validator,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: label,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Project Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildField(
                label: "Title",
                onChanged: (value) => _title = value,
                validator: (value) => _requiredValidator(value, "Title"),
              ),
              _buildField(
                label: "Description",
                maxLines: 5,
                onChanged: (value) => _description = value,
                validator: (value) => _requiredValidator(value, "Description"),
              ),
              _buildField(
                label: "Project URL",
                keyboardType: TextInputType.url,
                onChanged: (value) => _projectUrl = value,
                validator: (value) {
                  final error = _requiredValidator(value, "Project URL");
                  if (error != null) return error;
                  if (!_isValidUrl(value!.trim())) {
                    return "Format URL tidak valid (contoh: https://github.com/...)";
                  }
                  return null;
                },
              ),
              _buildField(
                label: "Project Image URL (Optional)",
                keyboardType: TextInputType.url,
                onChanged: (value) => _projectImageUrl = value,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return null;
                  if (!_isValidUrl(value.trim())) {
                    return "Format URL tidak valid!";
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
